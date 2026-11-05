/// Example application demonstrating the Adbrix Flutter plugin.
///
/// This example shows how to:
/// - Initialize the Adbrix SDK with configuration
/// - Request App Tracking Transparency (ATT) authorization on iOS
/// - Log predefined events (login, purchase)
/// - Log custom events with properties
library;

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:adbrix_plugin/adbrix_plugin.dart';

/// Entry point for the Adbrix example application.
void main() {
  runApp(const AdbrixApp());
}

/// The root widget of the Adbrix example application.
///
/// This widget initializes the Adbrix SDK with the provided configuration
/// and demonstrates various SDK features.
class AdbrixApp extends StatefulWidget {
  /// Creates an [AdbrixApp] widget.
  const AdbrixApp({super.key});

  @override
  State<AdbrixApp> createState() => _AdbrixAppState();
}

class _AdbrixAppState extends State<AdbrixApp> {
  @override
  void initState() {
    super.initState();

    final config = <String, dynamic>{
      ABConfig.iosLogLevel: ABiOSLogLevel.verbose,
      ABConfig.androidLogEnable: true,
      ABConfig.androidLogLevel: ABAndroidLogLevel.verbose,
      ABConfig.androidCollectGoogleAdvertisingId: true,
      // ABConfig.iosTrackingTimeout: ABiOSTrackingTimeout.timeout60,
    };

    Adbrix.initWithConfig(
      applicationKey: '{YOUR_APPLICATION_KEY}',
      secretKey: '{YOUR_SECRET_KEY}',
      config: config,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Adbrix Sample',
      home: HomePage(),
    );
  }
}

/// The home page of the Adbrix example application.
///
/// Displays buttons for testing various Adbrix SDK features including
/// ATT authorization requests and event logging.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  void _requestAtt() {
    Permission.appTrackingTransparency.request().then(
      (status) => Adbrix.attAuthorized(authorized: status.isGranted),
    );
  }

  void _logLogin() {
    Adbrix.logEvent(eventName: ABEvent.login);
  }

  void _logPurchase() {
    final product = {
      ABEventProperty.itemProductId: '상품번호',
      ABEventProperty.itemProductName: '상품이름',
      ABEventProperty.itemCategory1: '식품',
      ABEventProperty.itemCategory2: '과자',
      ABEventProperty.itemPrice: 5000.0,
      ABEventProperty.itemQuantity: 5,
      ABEventProperty.itemDiscount: 500.0,
      ABEventProperty.itemCurrency: ABCurrency.krw,
    };

    final purchaseParams = {
      ABEventProperty.items: [product],
      ABEventProperty.orderId: '주문번호',
      ABEventProperty.paymentMethod: 'BankTransfer',
      ABEventProperty.orderSales: 25500.0,
      ABEventProperty.deliveryCharge: 3000.0,
      ABEventProperty.discount: 0.0,
    };

    Adbrix.logEvent(eventName: ABEvent.purchase, properties: purchaseParams);
  }

  void _logCustomEvent() {
    Adbrix.logEvent(
      eventName: 'custom_event',
      properties: {
        'custom_property_1': 34000,
        'custom_property_2': 42.195,
        'custom_property_3': "Seoul",
        'custom_property_4': true,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adbrix Sample')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Permissions',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _requestAtt,
            child: const Text('Request ATT Authorization'),
          ),
          const SizedBox(height: 24),
          Text(
            'Log Event',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _logLogin,
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: _logPurchase,
            child: const Text('Purchase'),
          ),
          ElevatedButton(
            onPressed: _logCustomEvent,
            child: const Text('Custom Event'),
          ),
        ],
      ),
    );
  }
}
