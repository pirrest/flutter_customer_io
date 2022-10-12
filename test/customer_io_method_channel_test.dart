import 'package:customer_io/customer_io.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:customer_io/customer_io_method_channel.dart';

void main() {
  MethodChannelCustomerIo platform = MethodChannelCustomerIo();
  const MethodChannel channel = MethodChannel('customer_io');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return Future.value();
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('initialize', () async {
    expect(platform.initialize(siteId: "siteId", apiKey: "apiKey", region:CustomerIoRegion.eu), isInstanceOf<Future>());
  });
}
