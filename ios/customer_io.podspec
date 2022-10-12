#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint customer_io.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'customer_io'
  s.version          = '0.0.1'
  s.summary          = 'customer.io SDK integration for Flutter.'
  s.description      = <<-DESC
customer.io SDK integration for Flutter.
SDK version: 1.2.0-beta.2
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
#   s.dependency 'CustomerIO', '1.2.0-beta.3'
#   s.dependency 'CustomerIOCommon', '1.2.0-beta.3'
  s.dependency 'CustomerIOTracking', '1.2.0-beta.3'
  s.dependency 'CustomerIOMessagingInApp', '1.2.0-beta.3'
#   s.dependency 'CustomerIOMessagingPushFCM', '1.2.0-beta.3'
  s.dependency 'CustomerIOMessagingPushAPN', '1.2.0-beta.3'
#   s.dependency "FirebaseMessaging", '~> 9.6.0'
#   s.dependency "FirebaseCore", '~> 9.6.0'
end
