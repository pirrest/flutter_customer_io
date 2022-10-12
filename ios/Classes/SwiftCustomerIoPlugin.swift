import Flutter
import UIKit
import CioMessagingInApp
import CioTracking
import CioMessagingPush
import CioMessagingPushAPN
import Common
import Foundation

public class SwiftCustomerIoPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "customer_io", binaryMessenger: registrar.messenger())
    let instance = SwiftCustomerIoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    log(message: "\(call.method) ( \(call.arguments) )")
    switch call.method {
    case "initialize":
      let arguments = call.arguments as! Dictionary<String, Any>
      let siteId = arguments["siteId"] as! String
      let apiKey = arguments["apiKey"] as! String
      let regionRawOrNil = arguments["region"] as? String
      var region: Region?
      if let regionRaw = regionRawOrNil {
        switch (regionRaw) {
        case "us":
          region = Region.US
        case "eu":
          region = Region.EU
        default:
          region = Region.US
        }
      }
      if region == nil {
        CustomerIO.initialize(siteId: siteId, apiKey: apiKey) {
          $0.logLevel = .debug
        }
      } else {
        CustomerIO.initialize(siteId: siteId, apiKey: apiKey, region: region!) {
          $0.logLevel = .debug
        }
      }
    case "initMessagingInApp":
      let arguments = call.arguments as! Dictionary<String, Any>
      let organizationId = arguments["organizationId"] as! String
      MessagingInApp.shared.initialize(organizationId: organizationId)
    case "setProfileAttributes":
      let arguments = call.arguments as! Dictionary<String, Any>
      let data = arguments["data"] as! Dictionary<String, Any>
      log(message: "data: \(data)")
      CustomerIO.shared.profileAttributes = data;
    case "setDeviceAttributes":
      let arguments = call.arguments as! Dictionary<String, Any>
      let data = arguments["data"] as! Dictionary<String, Any>
      CustomerIO.shared.deviceAttributes = data;
    case "identify":
      let arguments = call.arguments as! Dictionary<String, Any>
      let identifier = arguments["identifier"] as! String
      let dataOrNil = arguments["data"] as? Dictionary<String, Any>
      if let data = dataOrNil {
        CustomerIO.shared.identify(identifier: identifier, body: data)
      } else {
        CustomerIO.shared.identify(identifier: identifier)
      }
    case "screen":
      let arguments = call.arguments as! Dictionary<String, Any>
      let name = arguments["name"] as! String
      CustomerIO.shared.screen(name: name)
    case "track":
      let arguments = call.arguments as! Dictionary<String, Any>
      let name = arguments["name"] as! String
      CustomerIO.shared.track(name: name)
    case "trackPush":
      let arguments = call.arguments as! Dictionary<String, Any>
      let deliveryId = arguments["deliveryId"] as! String
      let deviceToken = arguments["deviceToken"] as! String
      let event = arguments["event"] as! String
      MessagingPush.shared.trackMetric(deliveryID: deliveryId, event: _metricFromString(eventStr:event), deviceToken: deviceToken)
    case "clearIdentify":
      CustomerIO.shared.clearIdentify();
    default: break
    }
  }

  private func _metricFromString(eventStr: String) -> Metric {
    switch (eventStr) {
    case "delivered":
      return .delivered
    case "opened":
      return .opened
    case "converted":
      return .converted
    default:
      return .delivered
    }
  }

  private func log(message: String) {
//    NSLog("CustomerIoPlugin -> " + message)
  }
}
