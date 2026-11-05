# Adbrix Plugin Example

Demonstrates how to use the adbrix_plugin Flutter plugin.

## Requirements

- Flutter SDK 3.24.0+
- Dart SDK 3.5.0+
- iOS 15.0+ / Android minSdkVersion 21+

## Getting Started

### Prerequisites

After cloning the repository, create `android/local.properties`:

```properties
sdk.dir=/path/to/android/sdk
flutter.sdk=/path/to/flutter
flutter.buildMode=debug
```

### Run the Example

```bash
cd adbrix_plugin/example
flutter pub get
flutter run
```

## iOS Build Options

The plugin supports both **Swift Package Manager (SPM)** and **CocoaPods**.

> **Note:** [CocoaPods Specs repository will transition to read-only in December 2026](https://blog.cocoapods.org/CocoaPods-Specs-Repo/), so SPM is recommended.

### Swift Package Manager (Default)

Flutter 3.24+ uses SPM by default. No additional configuration required.

```bash
flutter clean
flutter pub get
flutter run
```

To explicitly enable SPM (if previously disabled):

```yaml
# pubspec.yaml - remove or comment out:
# flutter:
#   config:
#     enable-swift-package-manager: false
```

### CocoaPods

To use CocoaPods instead of SPM:

**Step 1:** Add to `pubspec.yaml`:

```yaml
flutter:
  config:
    enable-swift-package-manager: false
```

**Step 2:** Clean and rebuild:

```bash
flutter clean

# Remove SPM artifacts if switching from SPM
rm -rf ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/swiftpm

flutter pub get
cd ios && pod install && cd ..
flutter run
```

### Switching Between SPM and CocoaPods

When switching dependency managers, clean build artifacts:

**SPM → CocoaPods:**
```bash
flutter clean
rm -rf ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/swiftpm
# Update pubspec.yaml to disable SPM
flutter pub get
cd ios && pod install && cd ..
```

**CocoaPods → SPM:**
```bash
flutter clean
rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Runner.xcworkspace
# Update pubspec.yaml to enable SPM (or remove the disable setting)
flutter pub get
```

## Android Build

```bash
flutter clean
flutter pub get
flutter run
```

## Building for Release

### Android App Bundle

```bash
flutter build appbundle --release
```

### iOS Archive

```bash
flutter build ios --release
```

## Plugin Validation (CocoaPods)

```bash
cd adbrix_plugin
pod lib lint ios/adbrix_plugin.podspec --configuration=Debug --skip-tests --use-modular-headers --use-libraries
```

## SDK Versions

| Platform | Version | Package Manager |
|----------|---------|-----------------|
| Android  | 4.1.0   | Gradle |
| iOS      | 3.2.4   | Swift Package Manager |
| iOS      | 3.2.3   | CocoaPods |

## References

- [Adbrix Developer Guide](https://adbrix.gitbook.io/developer-guide/platform/flutter)
- [Swift Package Manager for Flutter](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers)
- [Flutter iOS deployment](https://docs.flutter.dev/deployment/ios)
