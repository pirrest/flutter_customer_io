import 'customer_io_platform_interface.dart';

enum CustomerIoRegion { us, eu }
enum CustomerIoPushEvent { delivered, opened, converted }

class CustomerIo {
  Future initialize({
    required String siteId,
    required String apiKey,
    CustomerIoRegion? region,
  }) async {
    await CustomerIoPlatform.instance.initialize(
      siteId: siteId,
      apiKey: apiKey,
      region: region,
    );
  }

  Future identify(
      {required String identifier, Map<String, dynamic>? data}) async {
    if (data == null) {
      await CustomerIoPlatform.instance.identify(identifier: identifier);
    } else {
      await CustomerIoPlatform.instance.identify(
        identifier: identifier,
        data: data,
      );
    }
  }

  Future initMessagingInApp({required String organizationId}) async {
    await CustomerIoPlatform.instance
        .initMessagingInApp(organizationId: organizationId);
  }

  Future setProfileAttributes(Map<String, dynamic> data) async {
    await CustomerIoPlatform.instance.setProfileAttributes(data);
  }

  Future setDeviceAttributes(Map<String, dynamic> data) async {
    await CustomerIoPlatform.instance.setDeviceAttributes(data);
  }

  Future screen({required String name}) async {
    await CustomerIoPlatform.instance.screen(name: name);
  }

  Future track({required String name}) async {
    await CustomerIoPlatform.instance.track(name: name);
  }

  Future trackPush({
    required String deliveryId,
    required CustomerIoPushEvent event,
    required String deviceToken,
  }) async {
    await CustomerIoPlatform.instance.trackPush(
      deliveryId: deliveryId,
      event: event.name,
      deviceToken: deviceToken,
    );
  }

  Future clearIdentify() async {
    await CustomerIoPlatform.instance.clearIdentify();
  }
}
