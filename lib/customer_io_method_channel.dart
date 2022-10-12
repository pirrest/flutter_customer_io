import 'package:customer_io/customer_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'customer_io_platform_interface.dart';

/// An implementation of [CustomerIoPlatform] that uses method channels.
class MethodChannelCustomerIo extends CustomerIoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('customer_io');

  @override
  Future initialize({
    required String siteId,
    required String apiKey,
    CustomerIoRegion? region,
  }) async {
    await methodChannel.invokeMethod('initialize', <String, dynamic>{
      'siteId': siteId,
      'apiKey': apiKey,
      if (region != null) 'region': region.name,
    });
  }

  @override
  Future identify({
    required String identifier,
    Map<String, dynamic>? data,
  }) async {
    await methodChannel.invokeMethod('identify', <String, dynamic>{
      'identifier': identifier,
      'data': data,
    });
  }

  @override
  Future clearIdentify() async {
    await methodChannel.invokeMethod('clearIdentify');
  }

  @override
  Future screen({required String name}) async {
    await methodChannel.invokeMethod('screen', <String, dynamic>{
      'name': name,
    });
  }

  @override
  Future track({required String name}) async {
    await methodChannel.invokeMethod('track', <String, dynamic>{
      'name': name,
    });
  }

  @override
  Future trackPush({
    required String deliveryId,
    required String event,
    required String deviceToken,
  }) async {
    await methodChannel.invokeMethod('trackPush', <String, dynamic>{
      'deliveryId': deliveryId,
      'event': event,
      'deviceToken': deviceToken,
    });
  }

  @override
  Future initMessagingInApp({required String organizationId}) async {
    await methodChannel.invokeMethod('initMessagingInApp', <String, dynamic>{
      'organizationId': organizationId,
    });
  }

  @override
  Future setDeviceAttributes(Map<String, dynamic> data) async {
    await methodChannel.invokeMethod('setDeviceAttributes', <String, dynamic>{
      'data': data,
    });
  }

  @override
  Future setProfileAttributes(Map<String, dynamic> data) async {
    await methodChannel.invokeMethod('setProfileAttributes', <String, dynamic>{
      'data': data,
    });
  }
}
