import 'package:customer_io/customer_io.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'customer_io_method_channel.dart';

abstract class CustomerIoPlatform extends PlatformInterface {
  /// Constructs a CustomerIoPlatform.
  CustomerIoPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomerIoPlatform _instance = MethodChannelCustomerIo();

  /// The default instance of [CustomerIoPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomerIo].
  static CustomerIoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomerIoPlatform] when
  /// they register themselves.
  static set instance(CustomerIoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future initialize({
    required String siteId,
    required String apiKey,
    CustomerIoRegion? region,
  });

  Future initMessagingInApp({required String organizationId});

  Future identify({required String identifier, Map<String, dynamic>? data});

  Future setProfileAttributes(Map<String, dynamic> data);
  Future setDeviceAttributes(Map<String, dynamic> data);

  Future clearIdentify();
  Future screen({required String name});
  Future track({required String name});

  Future trackPush({
    required String deliveryId,
    required String event,
    required String deviceToken,
  });
}
