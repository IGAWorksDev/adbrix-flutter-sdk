# Adbrix Flutter SDK

This repository contains the Dart interface and native Flutter functionality for the Flutter plugins derived from the Adbrix 2.0 Android and iOS SDKs.

- [Adbrix User Guide](https://adbrix.gitbook.io/user-guide)
- [Adbrix Developer Guide](https://adbrix.gitbook.io/developer-guide/platform/flutter)

## Requirements

- Dart SDK 3.5.0+
- Flutter SDK 3.24.0+
- iOS 15.0+ (Xcode 27 requirement)
- Android minSdkVersion 21+

## Dependencies

### Android

- [com.igaworks.adbrix:android-sdk:4.1.0](./CHANGELOG.md)
- com.android.installreferrer:installreferrer:2.2
- com.google.android.gms:play-services-ads-identifier:18.0.1
- com.google.android.gms:play-services-appset:16.0.2

### iOS

- [AdBrixRmKit 3.2.4](./CHANGELOG.md) (Swift Package Manager)
- [adbrix2.0 3.2.3](./CHANGELOG.md) (CocoaPods)

## iOS Dependency Management

The plugin supports both **Swift Package Manager (SPM)** and **CocoaPods** for iOS.

> **Note:** [CocoaPods Specs repository will transition to read-only in December 2026](https://blog.cocoapods.org/CocoaPods-Specs-Repo/), so SPM is recommended for new Flutter iOS projects.

### Swift Package Manager (Default)

Flutter 3.24+ uses SPM by default. No additional configuration required.

```bash
flutter pub get
flutter run
```

### CocoaPods

To use CocoaPods instead of SPM, add to your `pubspec.yaml`:

```yaml
flutter:
  config:
    enable-swift-package-manager: false
```

Then run:

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter run
```

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  adbrix_plugin: ^2.0.0
```

## Quick Start

```dart
import 'package:adbrix_plugin/adbrix_plugin.dart';

void main() {
  // Initialize SDK
  Adbrix.initWithConfig(
    applicationKey: 'YOUR_APP_KEY',
    secretKey: 'YOUR_SECRET_KEY',
    config: {
      ABConfig.iosLogLevel: ABiOSLogLevel.debug,
      ABConfig.androidLogLevel: ABAndroidLogLevel.debug,
    },
  );
  
  runApp(MyApp());
}

// Log events
Adbrix.logEvent(eventName: ABEvent.login);

Adbrix.logEvent(
  eventName: ABEvent.purchase,
  properties: {
    ABEventProperty.orderId: 'ORDER_123',
    ABEventProperty.orderSales: 99.99,
    ABEventProperty.paymentMethod: ABPaymentMethod.creditCard,
  },
);
```

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history and release notes.
