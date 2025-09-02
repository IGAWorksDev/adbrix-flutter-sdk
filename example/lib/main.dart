import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:adbrix_plugin/adbrix_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;
  String? _deepLink;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      navigatorKey: _navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      ],
      redirect: (context, state) {
        // 딥링크 처리
        if (state.uri.toString().startsWith('abx2jimmy://') || state.uri.toString().startsWith('adbrixsample://')) {
          setState(() {
            _deepLink = state.uri.toString();
          });
          _showDeepLinkAlert(_deepLink!);
        }
        return null;
      },
    );
    init();
  }

  Future<void> init() async {
    sdkInit();
    blockDeferredDeepLinkLaunch();
  }

  void sdkInit() {
    Map<String, dynamic> config = {
      ABConfig.iosLogEnable: true,
      ABConfig.androidLogEnable: true,
      ABConfig.androidLogLevel: ABAndroidLogLevel.verbose,
      ABConfig.androidCollectGoogleAdvertisingId: true,
      ABConfig.iosTrackingTimeout: ABiOSTrackingTimeout.timeout60
    };
    Adbrix.initWithConfig(
      applicationKey: "{YOUR_APPLICATION_KEY}",
      secretKey: "{YOUR_SECRET_KEY}",
      config: config,
    );
  }

  void blockDeferredDeepLinkLaunch() {
    Future<AdbrixDeepLinkCallback?> adbrixDeepLinkCallback =
        Adbrix.blockDeferredDeepLinkLaunch();
    adbrixDeepLinkCallback
        .then((value) {
          if (value != null) {
            String deepLink = value.deepLink;
            setState(() {
              _deepLink = deepLink;
            });
            _showDeepLinkAlert(deepLink + " deferred!!!");
            print("blockDeferredDeepLinkLaunch result: "+value.toString());
          }else{
            print("blockDeferredDeepLinkLaunch result is null");
          }
        })
        .catchError((error) {
          print("error in blockDeferredDeepLinkLaunch. ${error}");
        });
  }

  void _showDeepLinkAlert(String deepLink) {
    if (_navigatorKey.currentContext != null) {
      showDialog(
        context: _navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('딥링크 수신'),
            content: Text('수신된 딥링크: $deepLink'),
            actions: <Widget>[
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adbrix Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adbrix Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('ATT', style: Theme.of(context).textTheme.headlineLarge),
              ElevatedButton(
                onPressed: () {
                  if (defaultTargetPlatform == TargetPlatform.iOS) {
                    Permission.appTrackingTransparency.request().then((value) {
                      if (value.isGranted) {
                        Adbrix.attAuthorized(authorized: true);
                      } else {
                        Adbrix.attAuthorized(authorized: false);
                      }
                    });
                  }
                },
                child: const Text('requestTrackingAuthorization'),
              ),
              Text(
                'LogEvent',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'UserAnalytics',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Adbrix.logEvent(eventName: ABEvent.login);
                  print('Login 함수가 호출되었습니다.');
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Adbrix.logEvent(eventName: ABEvent.logout);
                  print('Logout 함수가 호출되었습니다.');
                },
                child: const Text('Logout'),
              ),
              Text('Common', style: Theme.of(context).textTheme.headlineMedium),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    ABEventProperty.signChannel: ABSignUpChannel.kakao,
                  };
                  Adbrix.logEvent(eventName: ABEvent.signUp, properties: param);
                  print('Sign Up 함수가 호출되었습니다.');
                },
                child: const Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    ABEventProperty.prevVer: '1.0.0',
                    ABEventProperty.currVer: '1.0.1',
                  };
                  Adbrix.logEvent(
                    eventName: ABEvent.appUpdate,
                    properties: param,
                  );
                  print('AppUpdate 함수가 호출되었습니다.');
                },
                child: const Text('AppUpdate'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    ABEventProperty.inviteChannel: 'Kakao',
                  };
                  Adbrix.logEvent(eventName: ABEvent.invite, properties: param);
                  print('Invite 함수가 호출되었습니다.');
                },
                child: const Text('Invite'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    ABEventProperty.paymentMethod: ABPaymentMethod.creditCard
                  };
                  Adbrix.logEvent(
                    eventName: ABEvent.useCredit,
                    properties: param,
                  );
                  print('UseCredit 함수가 호출되었습니다.');
                },
                child: const Text('UseCredit'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {
                    ABEventProperty.items: items,
                    ABEventProperty.orderId: '상품번호',
                    ABEventProperty.paymentMethod: ABPaymentMethod.bankTransfer,
                    ABEventProperty.orderSales: 5000.0,
                    ABEventProperty.deliveryCharge: 3000.0,
                    ABEventProperty.itemDiscount: 0.0,
                  };

                  Adbrix.logEvent(
                    eventName: ABEvent.purchase,
                    properties: param,
                  );
                  print('Purchase 함수가 호출되었습니다.');
                },
                child: const Text('Purchase'),
              ),
              Text(
                'Commerce',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Adbrix.logEvent(eventName: ABEvent.viewHome);
                  print('View Home 함수가 호출되었습니다.');
                },
                child: const Text('View Home'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {
                    ABEventProperty.items: items,
                    ABEventProperty.category1: '식품',
                    ABEventProperty.category2: '과자',
                  };

                  Adbrix.logEvent(
                    eventName: ABEvent.categoryView,
                    properties: param,
                  );
                  print('CategoryView 함수가 호출되었습니다.');
                },
                child: const Text('Category View'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.productView,
                    properties: param,
                  );
                  print('Product View 함수가 호출되었습니다.');
                },
                child: const Text('Product View'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.addToCart,
                    properties: param,
                  );
                  print('Add to Cart 함수가 호출되었습니다.');
                },
                child: const Text('Add To Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.addToWishlist,
                    properties: param,
                  );
                  print('Add to Wishlist 함수가 호출되었습니다.');
                },
                child: const Text('Add To Wishlist'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.reviewOrder,
                    properties: param,
                  );
                  print('ReviewOrder 함수가 호출되었습니다.');
                },
                child: const Text('ReviewOrder'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {
                    ABEventProperty.items: items,
                    ABEventProperty.penaltyCharge: 2000.0
                  };

                  Adbrix.logEvent(eventName: ABEvent.refund, properties: param);
                  print('Refund 함수가 호출되었습니다.');
                },
                child: const Text('Refund'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {
                    ABEventProperty.items: items,
                    ABEventProperty.keyword: '삼겹살',
                  };

                  Adbrix.logEvent(eventName: ABEvent.search, properties: param);
                  print('Search 함수가 호출되었습니다.');
                },
                child: const Text('Search'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {
                    ABEventProperty.items: items,
                    ABEventProperty.sharingChannel: 'Facebook',
                  };

                  Adbrix.logEvent(eventName: ABEvent.share, properties: param);
                  print('Share 함수가 호출되었습니다.');
                },
                child: const Text('Share'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.listView,
                    properties: param,
                  );
                  print('List View 함수가 호출되었습니다.');
                },
                child: const Text('List View'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> item = {
                    ABEventProperty.itemProductId: '상품번호',
                    ABEventProperty.itemProductName: '상품이름',
                    ABEventProperty.itemCategory1: '식품',
                    ABEventProperty.itemCategory2: '과자',
                    ABEventProperty.itemPrice: 1500.0,
                    ABEventProperty.itemDiscount: 500.0,
                    ABEventProperty.itemQuantity: 5,
                  };

                  List<Map<String, dynamic>> items = [item];

                  Map<String, dynamic> param = {ABEventProperty.items: items};

                  Adbrix.logEvent(
                    eventName: ABEvent.cartView,
                    properties: param,
                  );
                  print('Cart View 함수가 호출되었습니다.');
                },
                child: const Text('Cart View'),
              ),

              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    ABEventProperty.paymentMethod: ABPaymentMethod.bankTransfer,
                  };
                  Adbrix.logEvent(eventName: ABEvent.paymentInfoAdded, properties: param);
                  print('Payment Info Added 함수가 호출되었습니다.');
                },
                child: const Text('Payment Info Added'),
              ),
              Text('Game', style: Theme.of(context).textTheme.headlineMedium),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {ABEventProperty.level: 100};
                  Adbrix.logEvent(
                    eventName: ABEvent.levelAchieved,
                    properties: param,
                  );
                  print('LevelArchived 함수가 호출되었습니다.');
                },
                child: const Text('LevelArchived'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {ABEventProperty.isSkip: true};
                  Adbrix.logEvent(
                    eventName: ABEvent.tutorialCompleted,
                    properties: param,
                  );
                  print('TutorialCompleted 함수가 호출되었습니다.');
                },
                child: const Text('TutorialCompleted'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {};
                  Adbrix.logEvent(
                    eventName: ABEvent.characterCreated,
                    properties: param,
                  );
                  print('CharacterCreated 함수가 호출되었습니다.');
                },
                child: const Text('CharacterCreated'),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {ABEventProperty.stage: '1-1'};
                  Adbrix.logEvent(
                    eventName: ABEvent.stageCleared,
                    properties: param,
                  );
                  print('StageCleared 함수가 호출되었습니다.');
                },
                child: const Text('StageCleared'),
              ),
              Text(
                'CustomEvent',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> param = {
                    'is_logined': true,
                    'username': 'hello',
                    'visit_count': 1000,
                  };
                  Adbrix.logEvent(
                    eventName: 'custom_event_1',
                    properties: param,
                  );
                  print('Custom Event 함수가 호출되었습니다.');
                },
                child: const Text('Custom Event'),
              ),
              Text(
                'Dfinery',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Adbrix.enableSDK();
                  print('enableSDK 함수가 호출되었습니다.');
                },
                child: const Text('enableSDK'),
              ),
              ElevatedButton(
                onPressed: () {
                  Adbrix.disableSDK();
                  print('disableSDK 함수가 호출되었습니다.');
                },
                child: const Text('disableSDK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
