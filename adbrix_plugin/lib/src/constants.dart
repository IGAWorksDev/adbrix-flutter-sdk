/// A class that contains Adbrix predefined event name constants.
///
/// Use these constants with [Adbrix.logEvent] to track standard events.
///
/// Example:
/// ```dart
/// Adbrix.logEvent(eventName: ABEvent.login);
/// ```
class ABEvent {
  ABEvent._();

  /// Reports events when a user logs in.
  static const String login = 'abx:login';

  /// Reports events when a user logs out.
  static const String logout = 'abx:logout';

  /// Reports events in which users sign up for membership.
  static const String signUp = 'abx:sign_up';

  /// Reports events in which users use credit.
  static const String useCredit = 'abx:use_credit';

  /// Reports events in which the app is updated.
  static const String appUpdate = 'abx:app_update';

  /// Reports events in which users send invitations.
  static const String invite = 'abx:invite';

  /// Reports events in which a user pays for a product.
  static const String purchase = 'abx:purchase';

  /// Reports events in which a game level is achieved.
  static const String levelAchieved = 'abx:level_achieved';

  /// Reports events in which a game tutorial is completed.
  static const String tutorialCompleted = 'abx:tutorial_completed';

  /// Reports events in which a game character is created.
  static const String characterCreated = 'abx:character_created';

  /// Reports events in which a game stage is cleared.
  static const String stageCleared = 'abx:stage_cleared';

  /// Reports events in which a refund is processed.
  static const String refund = 'abx:refund';

  /// Reports events in which items are added to the cart.
  static const String addToCart = 'abx:add_to_cart';

  /// Reports events in which items are added to the wishlist.
  static const String addToWishlist = 'abx:add_to_wishlist';

  /// Reports events in which a product is viewed.
  static const String productView = 'abx:product_view';

  /// Reports events in which a category is viewed.
  static const String categoryView = 'abx:category_view';

  /// Reports events in which an order is reviewed.
  static const String reviewOrder = 'abx:review_order';

  /// Reports events in which a search is conducted.
  static const String search = 'abx:search';

  /// Reports events in which content is shared.
  static const String share = 'abx:share';

  /// Reports events in which the home view is displayed.
  static const String viewHome = 'abx:view_home';

  /// Reports events in which a list view is displayed.
  static const String listView = 'abx:list_view';

  /// Reports events in which the cart view is displayed.
  static const String cartView = 'abx:cart_view';

  /// Reports events in which payment information is added.
  static const String paymentInfoAdded = 'abx:paymentinfo_added';
}

/// A class that contains constants for Adbrix's event property names.
///
/// Use these constants as keys in the properties map passed to [Adbrix.logEvent].
///
/// Example:
/// ```dart
/// Adbrix.logEvent(
///   eventName: ABEvent.purchase,
///   properties: {
///     ABEventProperty.orderId: 'ORDER_123',
///     ABEventProperty.orderSales: 99.99,
///     ABEventProperty.paymentMethod: ABPaymentMethod.creditCard,
///   },
/// );
/// ```
class ABEventProperty {
  ABEventProperty._();

  /// Event value for [ABEvent.tutorialCompleted] event.
  ///
  /// Indicates whether the tutorial was skipped.
  static const String isSkip = 'abx:is_skip';

  /// Event value for [ABEvent.levelAchieved] event.
  ///
  /// The level number achieved.
  static const String level = 'abx:level';

  /// Event value for [ABEvent.stageCleared] event.
  ///
  /// The stage number cleared.
  static const String stage = 'abx:stage';

  /// Event value for [ABEvent.appUpdate] event.
  ///
  /// The previous app version before update.
  static const String prevVer = 'abx:prev_ver';

  /// Event value for [ABEvent.appUpdate] event.
  ///
  /// The current app version after update.
  static const String currVer = 'abx:curr_ver';

  /// Event value for [ABEvent.search] event.
  ///
  /// The search keyword entered by user.
  static const String keyword = 'abx:keyword';

  /// Event value for [ABEvent.share] event.
  ///
  /// The channel used for sharing. Use [ABSharingChannel] values.
  static const String sharingChannel = 'abx:sharing_channel';

  /// Event value for [ABEvent.signUp] event.
  ///
  /// The channel used for sign-up. Use [ABSignUpChannel] values.
  static const String signChannel = 'abx:sign_channel';

  /// Event value for [ABEvent.invite] event.
  ///
  /// The channel used for invitation. Use [ABInviteChannel] values.
  static const String inviteChannel = 'abx:invite_channel';

  /// Event value for [ABEvent.reviewOrder], [ABEvent.refund], [ABEvent.purchase] events.
  ///
  /// The unique order identifier.
  static const String orderId = 'abx:order_id';

  /// Event value for [ABEvent.reviewOrder], [ABEvent.purchase] events.
  ///
  /// The delivery charge amount.
  static const String deliveryCharge = 'abx:delivery_charge';

  /// Event value for [ABEvent.refund] event.
  ///
  /// The penalty charge amount for refund.
  static const String penaltyCharge = 'abx:penalty_charge';

  /// Event value for [ABEvent.purchase] event.
  ///
  /// The payment method used. Use [ABPaymentMethod] values.
  static const String paymentMethod = 'abx:payment_method';

  /// Event value for [ABEvent.purchase] event.
  ///
  /// The total sales amount of the order.
  static const String orderSales = 'abx:order_sales';

  /// Event value for [ABEvent.reviewOrder], [ABEvent.purchase] events.
  ///
  /// The discount amount applied.
  static const String discount = 'abx:discount';

  /// Event value for [ABEvent.categoryView] event.
  ///
  /// The first level category name.
  static const String category1 = 'abx:category1';

  /// Event value for [ABEvent.categoryView] event.
  ///
  /// The second level category name.
  static const String category2 = 'abx:category2';

  /// Event value for [ABEvent.categoryView] event.
  ///
  /// The third level category name.
  static const String category3 = 'abx:category3';

  /// Event value for [ABEvent.categoryView] event.
  ///
  /// The fourth level category name.
  static const String category4 = 'abx:category4';

  /// Event value for [ABEvent.categoryView] event.
  ///
  /// The fifth level category name.
  static const String category5 = 'abx:category5';

  /// Key value of an array containing products.
  ///
  /// This property can be added to the following events:
  /// [ABEvent.categoryView], [ABEvent.productView], [ABEvent.addToCart],
  /// [ABEvent.addToWishlist], [ABEvent.reviewOrder], [ABEvent.refund],
  /// [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String items = 'abx:items';

  /// Product ID property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemProductId = 'abx:product_id';

  /// Product name property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemProductName = 'abx:product_name';

  /// Product price property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemPrice = 'abx:price';

  /// Product quantity property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemQuantity = 'abx:quantity';

  /// Product discount property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemDiscount = 'abx:discount';

  /// Product currency property for items in [items] array.
  ///
  /// Use [ABCurrency] values. Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCurrency = 'abx:currency';

  /// Product first level category property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCategory1 = 'abx:category1';

  /// Product second level category property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCategory2 = 'abx:category2';

  /// Product third level category property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCategory3 = 'abx:category3';

  /// Product fourth level category property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCategory4 = 'abx:category4';

  /// Product fifth level category property for items in [items] array.
  ///
  /// Product created in Map format must be placed in [items].
  /// Applicable events: [ABEvent.categoryView], [ABEvent.productView],
  /// [ABEvent.addToCart], [ABEvent.addToWishlist], [ABEvent.reviewOrder],
  /// [ABEvent.refund], [ABEvent.search], [ABEvent.share], [ABEvent.listView],
  /// [ABEvent.cartView], [ABEvent.purchase].
  static const String itemCategory5 = 'abx:category5';
}

/// A class that contains constants for Adbrix's currency property names.
///
/// Use these constants with [ABEventProperty.itemCurrency] when tracking
/// commerce events.
class ABCurrency {
  ABCurrency._();

  /// South Korean Won currency code.
  static const String krw = 'KRW';

  /// United States Dollar currency code.
  static const String usd = 'USD';

  /// Japanese Yen currency code.
  static const String jpy = 'JPY';

  /// Euro currency code.
  static const String eur = 'EUR';

  /// British Pound Sterling currency code.
  static const String gbp = 'GBP';

  /// Chinese Yuan currency code.
  static const String cny = 'CNY';

  /// New Taiwan Dollar currency code.
  static const String twd = 'TWD';

  /// Hong Kong Dollar currency code.
  static const String hkd = 'HKD';

  /// Indonesian Rupiah currency code.
  static const String idr = 'IDR';

  /// Indian Rupee currency code.
  static const String inr = 'INR';

  /// Russian Ruble currency code.
  static const String rub = 'RUB';

  /// Thai Baht currency code.
  static const String thb = 'THB';

  /// Vietnamese Dong currency code.
  static const String vnd = 'VND';

  /// Malaysian Ringgit currency code.
  static const String myr = 'MYR';
}

/// A class that contains constants for Adbrix's invite channel property names.
///
/// Use these constants with [ABEventProperty.inviteChannel] when tracking
/// invitation events.
class ABInviteChannel {
  ABInviteChannel._();

  /// KakaoTalk messaging platform.
  static const String kakao = 'Kakao';

  /// Naver platform.
  static const String naver = 'Naver';

  /// LINE messaging platform.
  static const String line = 'Line';

  /// Google platform.
  static const String google = 'Google';

  /// Facebook social platform.
  static const String facebook = 'Facebook';

  /// Twitter social platform.
  static const String twitter = 'Twitter';

  /// WhatsApp messaging platform.
  static const String whatsApp = 'whatsApp';

  /// QQ messaging platform.
  static const String qq = 'QQ';

  /// WeChat messaging platform.
  static const String weChat = 'WeChat';

  /// Other invite channels not listed above.
  static const String etc = 'ETC';
}

/// A class that contains constants for Adbrix's payment method property names.
///
/// Use these constants with [ABEventProperty.paymentMethod] when tracking
/// purchase events.
class ABPaymentMethod {
  ABPaymentMethod._();

  /// Credit card payment method.
  static const String creditCard = 'CreditCard';

  /// Bank transfer payment method.
  static const String bankTransfer = 'BankTransfer';

  /// Mobile payment method (e.g., carrier billing).
  static const String mobilePayment = 'MobilePayment';

  /// Other payment methods not listed above.
  static const String etc = 'ETC';
}

/// A class that contains constants for Adbrix's sharing channel property names.
///
/// Use these constants with [ABEventProperty.sharingChannel] when tracking
/// share events.
class ABSharingChannel {
  ABSharingChannel._();

  /// Facebook social platform.
  static const String facebook = 'Facebook';

  /// KakaoTalk messaging platform.
  static const String kakaoTalk = 'KakaoTalk';

  /// KakaoStory social platform.
  static const String kakaoStory = 'KakaoStory';

  /// LINE messaging platform.
  static const String line = 'Line';

  /// WhatsApp messaging platform.
  static const String whatsApp = 'whatsApp';

  /// QQ messaging platform.
  static const String qq = 'QQ';

  /// WeChat messaging platform.
  static const String weChat = 'WeChat';

  /// SMS text messaging.
  static const String sms = 'SMS';

  /// Email sharing.
  static const String email = 'Email';

  /// URL copy to clipboard.
  static const String copyUrl = 'copyUrl';

  /// Other sharing channels not listed above.
  static const String etc = 'ETC';
}

/// A class that contains constants for Adbrix's sign up channel property names.
///
/// Use these constants with [ABEventProperty.signChannel] when tracking
/// sign-up events.
class ABSignUpChannel {
  ABSignUpChannel._();

  /// KakaoTalk account sign-up.
  static const String kakao = 'Kakao';

  /// Naver account sign-up.
  static const String naver = 'Naver';

  /// LINE account sign-up.
  static const String line = 'Line';

  /// Google account sign-up.
  static const String google = 'Google';

  /// Facebook account sign-up.
  static const String facebook = 'Facebook';

  /// Twitter account sign-up.
  static const String twitter = 'Twitter';

  /// WhatsApp account sign-up.
  static const String whatsApp = 'whatsApp';

  /// QQ account sign-up.
  static const String qq = 'QQ';

  /// WeChat account sign-up.
  static const String weChat = 'WeChat';

  /// Other sign-up channels not listed above.
  static const String etc = 'ETC';

  /// SK Telecom T-ID account sign-up.
  static const String sktId = 'SkTid';

  /// Apple ID account sign-up.
  static const String appleId = 'AppleId';

  /// Custom user ID sign-up.
  static const String userId = 'UserId';
}

/// A class that contains the configuration key constants for the Adbrix SDK.
///
/// Use these constants as keys in the config map passed to [Adbrix.initWithConfig].
///
/// Example:
/// ```dart
/// Adbrix.initWithConfig(
///   applicationKey: 'your_app_key',
///   secretKey: 'your_secret_key',
///   config: {
///     ABConfig.iosLogLevel: ABiOSLogLevel.debug,
///     ABConfig.androidLogLevel: ABAndroidLogLevel.debug,
///   },
/// );
/// ```
class ABConfig {
  ABConfig._();

  /// Show iOS log or not.
  @Deprecated('Use ABConfig.iosLogLevel instead.')
  static const String iosLogEnable = "setLog";

  /// iOS log level config key.
  ///
  /// Use this as the key in init config, and set one of [ABiOSLogLevel] values.
  /// Setting this key enables iOS SDK logging with the specified level.
  static const String iosLogLevel = "ABLogLevel";

  /// Show Android log or not.
  static const String androidLogEnable = "android_log_enable";

  /// Android log level setting.
  ///
  /// Use this as the key in init config, and set one of [ABAndroidLogLevel] values.
  static const String androidLogLevel = "android_log_level";

  /// Whether or not to collect Google advertising identifier in Adbrix Android SDK.
  static const String androidCollectGoogleAdvertisingId =
      "android_collect_google_advertising_id";

  /// Delays SDK event collection for the selected number of seconds.
  ///
  /// The delay occurs before the ATTAuthorized method is called or before
  /// moving to the background. Use [ABiOSTrackingTimeout] values.
  static const String iosTrackingTimeout = "trackingAuthorizeTimeOut";
}

/// The server response result of the deferred deep link value request that was called.
///
/// Use these constants to interpret the result code from [AdbrixDeepLinkCallback.result].
class ABDeepLinkResult {
  ABDeepLinkResult._();

  /// Deep link was successfully processed.
  static const int processed = 0;

  /// Installation was organic (no tracking link).
  static const int organic = 1;

  /// Tracking link settings are incorrect.
  static const int trackingLinkSettingsIncorrectly = 2;

  /// Organic non-CPI installation is in process.
  static const int organicNcpiInProcess = 3;

  /// No conversion data available.
  static const int noConversion = -1;
}

/// Android log level values for [ABConfig.androidLogLevel].
///
/// Follows the definition of the `android.util.Log` class constants.
/// Use these constants as the value of [ABConfig.androidLogLevel] to set
/// the minimum log level for Android SDK logging.
class ABAndroidLogLevel {
  ABAndroidLogLevel._();

  /// Verbose log level. Logs all messages.
  static const int verbose = 2;

  /// Debug log level. Logs debug and higher priority messages.
  static const int debug = 3;

  /// Info log level. Logs info and higher priority messages.
  static const int info = 4;

  /// Warning log level. Logs warning and higher priority messages.
  static const int warn = 5;

  /// Error log level. Logs only error and assert messages.
  static const int error = 6;

  /// Assert log level. Logs only assert messages.
  static const int assertLevel = 7;
}

/// iOS tracking timeout values for [ABConfig.iosTrackingTimeout].
///
/// Use these constants to specify how long the SDK should wait for
/// App Tracking Transparency authorization before proceeding with
/// event collection.
class ABiOSTrackingTimeout {
  ABiOSTrackingTimeout._();

  /// 60 seconds timeout.
  static const int timeout60 = 60;

  /// 120 seconds timeout.
  static const int timeout120 = 120;

  /// 180 seconds timeout.
  static const int timeout180 = 180;
}

/// iOS log level values for [ABConfig.iosLogLevel].
///
/// Use these constants as the value of [ABConfig.iosLogLevel] to enable
/// iOS SDK logging with the specified minimum log level.
class ABiOSLogLevel {
  ABiOSLogLevel._();

  /// Verbose log level. Logs all messages.
  static const int verbose = 2;

  /// Debug log level. Logs debug and higher priority messages.
  static const int debug = 3;

  /// Info log level. Logs info and higher priority messages.
  static const int info = 4;

  /// Warning log level. Logs warning and higher priority messages.
  static const int warn = 5;

  /// Error log level. Logs only error messages.
  static const int error = 6;
}
