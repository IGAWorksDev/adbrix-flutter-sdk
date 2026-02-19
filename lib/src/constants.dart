///A class that contains Adbrix event name constants.
class ABEvent {
  ///Reports events when a user logs in.
  static const String login = 'abx:login';

  ///Reports events when a user logs out.
  static const String logout = 'abx:logout';

  ///Reports events in which users sign up for membership.
  static const String signUp = 'abx:sign_up';

  ///Reports events in which users use credit.
  static const String useCredit = 'abx:use_credit';

  ///Reports events in which the app is updated.
  static const String appUpdate = 'abx:app_update';

  ///Reports events in which users send invitations.
  static const String invite = 'abx:invite';

  ///Reports events in which a user pays for a product.
  static const String purchase = 'abx:purchase';

  ///Reports events in which a game level is achieved.
  static const String levelAchieved = 'abx:level_achieved';

  ///Reports events in which a game tutorial is completed.
  static const String tutorialCompleted = 'abx:tutorial_completed';

  ///Reports events in which a game character is created.
  static const String characterCreated = 'abx:character_created';

  ///Reports events in which a game stage is cleared.
  static const String stageCleared = 'abx:stage_cleared';

  ///Reports events in which a refund is processed.
  static const String refund = 'abx:refund';

  ///Reports events in which items are added to the cart.
  static const String addToCart = 'abx:add_to_cart';

  ///Reports events in which items are added to the wishlist.
  static const String addToWishlist = 'abx:add_to_wishlist';

  ///Reports events in which a product is viewed.
  static const String productView = 'abx:product_view';

  ///Reports events in which a category is viewed.
  static const String categoryView = 'abx:category_view';

  ///Reports events in which an order is reviewed.
  static const String reviewOrder = 'abx:review_order';

  ///Reports events in which a search is conducted.
  static const String search = 'abx:search';

  ///Reports events in which content is shared.
  static const String share = 'abx:share';

  ///Reports events in which the home view is displayed.
  static const String viewHome = 'abx:view_home';

  ///Reports events in which a list view is displayed.
  static const String listView = 'abx:list_view';

  ///Reports events in which the cart view is displayed.
  static const String cartView = 'abx:cart_view';

  ///Reports events in which payment information is added.
  static const String paymentInfoAdded = 'abx:paymentinfo_added';
}

///A class that contains constants for Adbrix's event property names.
class ABEventProperty {
  ///EventValue for TUTORIAL_COMPLETED Event
  static const String isSkip = 'abx:is_skip';

  ///EventValue for LEVEL_ACHIEVED Event
  static const String level = 'abx:level';

  ///EventValue for STAGE_CLEARED Event
  static const String stage = 'abx:stage';

  ///EventValue for APP_UPDATE Event
  static const String prevVer = 'abx:prev_ver';

  ///EventValue for APP_UPDATE Event
  static const String currVer = 'abx:curr_ver';

  ///EventValue for SEARCH Event
  static const String keyword = 'abx:keyword';

  ///EventValue for SHARE Event
  static const String sharingChannel = 'abx:sharing_channel';

  ///EventValue for SIGN_UP Event
  static const String signChannel = 'abx:sign_channel';

  ///EventValue for INVITE Event
  static const String inviteChannel = 'abx:invite_channel';

  ///EventValue for REVIEW_ORDER, REFUND, PURCHASE Event
  static const String orderId = 'abx:order_id';

  ///EventValue for REVIEW_ORDER, PURCHASE Event
  static const String deliveryCharge = 'abx:delivery_charge';

  ///EventValue for REFUND Event
  static const String penaltyCharge = 'abx:penalty_charge';

  ///EventValue for PURCHASE Event
  static const String paymentMethod = 'abx:payment_method';

  ///EventValue for PURCHASE Event
  static const String orderSales = 'abx:order_sales';

  ///EventValue for REVIEW_ORDER, PURCHASE Event
  static const String discount = 'abx:discount';

  ///EventValue for CATEGORY_VIEW Event
  static const String category1 = 'abx:category1';

  ///EventValue for CATEGORY_VIEW Event
  static const String category2 = 'abx:category2';

  ///EventValue for CATEGORY_VIEW Event
  static const String category3 = 'abx:category3';

  ///EventValue for CATEGORY_VIEW Event
  static const String category4 = 'abx:category4';

  ///EventValue for CATEGORY_VIEW Event
  static const String category5 = 'abx:category5';

  ///Key value of an array containing products.
  ///
  ///This Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String items = 'abx:items';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemProductId = 'abx:product_id';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemProductName = 'abx:product_name';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemPrice = 'abx:price';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemQuantity = 'abx:quantity';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemDiscount = 'abx:discount';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCurrency = 'abx:currency';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCategory1 = 'abx:category1';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCategory2 = 'abx:category2';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCategory3 = 'abx:category3';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCategory4 = 'abx:category4';

  ///EventValue for Product Property
  ///
  ///Product created in JSONObject format must be placed in ITEMS.
  ///Product Property can be added to the following events:
  ///CATEGORY_VIEW, PRODUCT_VIEW, ADD_TO_CART, ADD_TO_WISHLIST, REVIEW_ORDER, REFUND, SEARCH, SHARE, LIST_VIEW, CART_VIEW, PURCHASE
  static const String itemCategory5 = 'abx:category5';
}

///A class that contains constants for Adbrix's currency property names.
class ABCurrency {
  static const String krw = 'KRW';
  static const String usd = 'USD';
  static const String jpy = 'JPY';
  static const String eur = 'EUR';
  static const String gbp = 'GBP';
  static const String cny = 'CNY';
  static const String twd = 'TWD';
  static const String hkd = 'HKD';
  static const String idr = 'IDR'; // Indonesia
  static const String inr = 'INR'; // India
  static const String rub = 'RUB'; // Russia
  static const String thb = 'THB'; // Thailand
  static const String vnd = 'VND'; // Vietnam
  static const String myr = 'MYR'; // Malaysia
}

///A class that contains constants for Adbrix's invite channel property names.
class ABInviteChannel {
  static const String kakao = 'Kakao';
  static const String naver = 'Naver';
  static const String line = 'Line';
  static const String google = 'Google';
  static const String facebook = 'Facebook';
  static const String twitter = 'Twitter';
  static const String whatsApp = 'whatsApp';
  static const String qq = 'QQ';
  static const String weChat = 'WeChat';
  static const String etc = 'ETC';
}

///A class that contains constants for Adbrix's payment method property names.
class ABPaymentMethod {
  static const String creditCard = 'CreditCard';
  static const String bankTransfer = 'BankTransfer';
  static const String mobilePayment = 'MobilePayment';
  static const String etc = 'ETC';
}

///A class that contains constants for Adbrix's sharing channel property names.
class ABSharingChannel {
  static const String facebook = 'Facebook';
  static const String kakaoTalk = 'KakaoTalk';
  static const String kakaoStory = 'KakaoStory';
  static const String line = 'Line';
  static const String whatsApp = 'whatsApp';
  static const String qq = 'QQ';
  static const String weChat = 'WeChat';
  static const String sms = 'SMS';
  static const String email = 'Email';
  static const String copyUrl = 'copyUrl';
  static const String etc = 'ETC';
}

///A class that contains constants for Adbrix's sign up channel property names.
class ABSignUpChannel {
  static const String kakao = 'Kakao';
  static const String naver = 'Naver';
  static const String line = 'Line';
  static const String google = 'Google';
  static const String facebook = 'Facebook';
  static const String twitter = 'Twitter';
  static const String whatsApp = 'whatsApp';
  static const String qq = 'QQ';
  static const String weChat = 'WeChat';
  static const String etc = 'ETC';
  static const String sktId = 'SkTid';
  static const String appleId = 'AppleId';
  static const String userId = 'UserId';
}

///A class that contains the names of the constants for the settings of the adbrix sdk.
class ABConfig {
  ///Show ios log or not
  @Deprecated('Use ABConfig.iosLogLevel instead.')
  static const String iosLogEnable = "setLog";

  ///iOS log level config key.
  ///
  ///Use this as the key in init config, and set one of [ABiOSLogLevel] values.
  ///Setting this key enables iOS SDK logging with the specified level.
  static const String iosLogLevel = "ABLogLevel";

  ///Show android log or not
  static const String androidLogEnable = "android_log_enable";

  ///Android log level setting
  static const String androidLogLevel = "android_log_level";

  ///Whether or not to collect Google advertising identifier in adbrix android sdk
  static const String androidCollectGoogleAdvertisingId =
      "android_collect_google_advertising_id";

  ///Delays SDK event collection for the selected number of seconds before the ATTAuthorized method is called or before moving to the background.
  static const String iosTrackingTimeout = "trackingAuthorizeTimeOut";
}

///The server response result of the deferred deep link value request that was called.
class ABDeepLinkResult {
  static const int processed = 0;
  static const int organic = 1;
  static const int trackingLinkSettingsIncorrectly = 2;
  static const int organicNcpiInProcess = 3;
  static const int noConversion = -1;
}

///Android log level
///
/// Follows the definition of the android.util.Log class constants.
class ABAndroidLogLevel {
  static const int verbose = 2;
  static const int debug = 3;
  static const int info = 4;
  static const int warn = 5;
  static const int error = 6;
  static const int assertLevel = 7;
}

///iOS Tracking Timeout
class ABiOSTrackingTimeout {
  static const int timeout60 = 60;
  static const int timeout120 = 120;
  static const int timeout180 = 180;
}

///iOS log level values for [ABConfig.iosLogLevel].
///
///Use these constants as the value of [ABConfig.iosLogLevel] to enable iOS SDK logging.
class ABiOSLogLevel {
  static const int verbose = 2;
  static const int debug = 3;
  static const int info = 4;
  static const int warn = 5;
  static const int error = 6;
}
