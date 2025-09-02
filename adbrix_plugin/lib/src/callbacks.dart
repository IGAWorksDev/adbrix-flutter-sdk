/// Deferred deep link information passed by calling blockDeferredDeepLinkLaunch.
class AdbrixDeepLinkCallback {
  ///The server response result of the deferred deep link value request that was called.
  final int _result;

  ///Deferred deep link.
  final String _deepLink;

  AdbrixDeepLinkCallback(this._result, this._deepLink);

  ///get server response result value of the deferred deep link value request that was called.
  int get result => _result;

  ///get deferred deep link.
  String get deepLink => _deepLink;
}
