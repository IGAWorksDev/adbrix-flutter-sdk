/// Deferred deep link information passed by calling blockDeferredDeepLinkLaunch.
class AdbrixDeepLinkCallback {
  /// The server response result of the deferred deep link value request that was called.
  final int _result;

  /// Deferred deep link.
  final String _deepLink;

  /// Creates a new [AdbrixDeepLinkCallback] instance.
  ///
  /// [_result] is the server response result code. See [ABDeepLinkResult] for possible values.
  /// [_deepLink] is the deferred deep link URL string.
  AdbrixDeepLinkCallback(this._result, this._deepLink);

  ///get server response result value of the deferred deep link value request that was called.
  int get result => _result;

  ///get deferred deep link.
  String get deepLink => _deepLink;
}
