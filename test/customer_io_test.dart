import 'package:flutter_test/flutter_test.dart';
import 'package:customer_io/customer_io.dart';
import 'package:customer_io/customer_io_platform_interface.dart';
import 'package:customer_io/customer_io_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomerIoPlatform
    with MockPlatformInterfaceMixin
    implements CustomerIoPlatform {
  @override
  Future initialize({
    required String siteId,
    required String apiKey,
    CustomerIoRegion? region,
  }) {
    return Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Future clearIdentify() {
    // TODO: implement clearIdentify
    throw UnimplementedError();
  }

  @override
  Future identify({required String identifier, Map<String, dynamic>? data}) {
    // TODO: implement identify
    throw UnimplementedError();
  }

  @override
  Future screen({required String name}) {
    // TODO: implement screen
    throw UnimplementedError();
  }

  @override
  Future track({required String name}) {
    // TODO: implement track
    throw UnimplementedError();
  }

  @override
  Future initMessagingInApp({required String organizationId}) {
    // TODO: implement initMessagingInApp
    throw UnimplementedError();
  }

  @override
  Future setDeviceAttributes(Map<String, dynamic> data) {
    // TODO: implement setDeviceAttributes
    throw UnimplementedError();
  }

  @override
  Future setProfileAttributes(Map<String, dynamic> data) {
    // TODO: implement setProfileAttributes
    throw UnimplementedError();
  }

  @override
  Future trackPush({required String deliveryId, required String event, required String deviceToken}) {
    // TODO: implement trackPush
    throw UnimplementedError();
  }
}

void main() {
  final CustomerIoPlatform initialPlatform = CustomerIoPlatform.instance;

  test('$MethodChannelCustomerIo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomerIo>());
  });

  test('getPlatformVersion', () async {
    CustomerIo customerIoPlugin = CustomerIo();
    MockCustomerIoPlatform fakePlatform = MockCustomerIoPlatform();
    CustomerIoPlatform.instance = fakePlatform;

    expect(
        customerIoPlugin.initialize(
            siteId: "siteId",
            apiKey: "apiKey",
            region: CustomerIoRegion.eu),
        isInstanceOf<Future>());
  });
}
