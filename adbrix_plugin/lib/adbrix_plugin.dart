import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:adbrix_plugin/src/callbacks.dart';

export 'src/callbacks.dart';
export 'src/constants.dart';

class Adbrix {
  static const MethodChannel _channel = MethodChannel('adbrix_plugin');

  /// Initializes the Adbrix SDK with the provided application details, authentication keys, and configuration settings.
  ///
  /// The applicationKey and secretKey must be obtained from the Adbrix console and registered beforehand.
  static void init({
    required String applicationKey,
    required String secretKey,
  }) {
    _channel.invokeMethod('init', {
      'applicationKey': applicationKey,
      'secretKey': secretKey,
    });
  }

  /// Initializes the Adbrix SDK with the provided application details, authentication keys, and configuration settings.
  ///
  /// The applicationKey and secretKey must be obtained from the Adbrix console and registered beforehand.
  /// The config parameter allows you to specify additional settings for the SDK to customize its behavior.
  static void initWithConfig({
    required String applicationKey,
    required String secretKey,
    Map<String, dynamic>? config,
  }) {
    _channel.invokeMethod('initWithConfig', {
      'applicationKey': applicationKey,
      'secretKey': secretKey,
      'config': config,
    });
  }

  ///Reports a event. You can use your own custom event or also can use predefined.
  static void logEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) {
    final Map<String, dynamic> params = {'eventName': eventName};
    if (properties != null) {
      params['properties'] = properties;
    }
    _channel.invokeMethod('logEvent', params);
  }

  ///If the SDK is disabled, re-enable it and communicate with the server.
  ///If the SDK is enabled, no action is taken.
  static void enableSDK() {
    _channel.invokeMethod('enableSDK');
  }

  ///In some extreme cases you might want to shut down all SDK functions due to legal and privacy compliance. This can be achieved with the disable API. Once this API is invoked, our SDK no longer communicates with our servers, stops functioning and also removing personal user data.
  ///You can re-enable the SDK at any time by calling the enable API.
  static void disableSDK() {
    _channel.invokeMethod('disableSDK');
  }

  ///Blocks the automatic launch of the deferred deep link activity and instead provides the deep link data and results through the specified callback.
  ///
  /// In the Adbrix SDK, when a deferred deep link is received, the SDK typically
  //  launches the associated activity. By calling this method, the automatic activity
  //  launch is disabled, and the deep link information is passed to the provided
  static Future<AdbrixDeepLinkCallback?> blockDeferredDeepLinkLaunch() async {
    final Map<dynamic, dynamic>? callback = await _channel.invokeMethod(
      'blockDeferredDeepLinkLaunch',
    );
    if (callback == null) {
      return null;
    }
    return AdbrixDeepLinkCallback(callback['result'], callback['deepLink']);
  }

  ///Call this when the app user approves or rejects a request from the App Tracking Transparency framework on iOS.
  static void attAuthorized({required bool authorized}) {
    if (Platform.isIOS) {
      _channel.invokeMethod('attAuthorized', {'authorized': authorized});
    }
  }
}
