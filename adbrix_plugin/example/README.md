# adbrix_plugin_example

Demonstrates how to use the adbrix_plugin plugin.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Prerequisites

After the initial clone from the repository, create `android/local.properties` with:

```properties
sdk.dir=/path/to/android/sdk
flutter.sdk=/path/to/flutter
flutter.buildMode=debug
```

## iOS Build Testing

The plugin supports both **Swift Package Manager (SPM)** and **CocoaPods**.

### Switch to Swift Package Manager (SPM)

**Option 1: Project-level configuration (recommended)**

Remove the `enable-swift-package-manager: false` setting from `pubspec.yaml` if present:

```yaml
# pubspec.yaml
flutter:
  # Remove or comment out:
  # config:
  #   enable-swift-package-manager: false
```

**Option 2: Global configuration**

```bash
flutter config --enable-swift-package-manager
```

**Then clean and rebuild:**

```bash
cd adbrix_plugin/example
flutter clean

# Remove CocoaPods artifacts
cd ios
rm -rf Pods Podfile.lock .symlinks Runner.xcworkspace
cd ..

flutter pub get
flutter run
```

### Switch to CocoaPods

**Option 1: Project-level configuration (recommended)**

Add to `pubspec.yaml`:

```yaml
# pubspec.yaml
flutter:
  config:
    enable-swift-package-manager: false
```

**Option 2: Global configuration**

```bash
flutter config --no-enable-swift-package-manager
```

**Then clean and rebuild:**

```bash
cd adbrix_plugin/example
flutter clean

# Remove SPM artifacts (if exists)
rm -rf ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/swiftpm

flutter pub get
cd ios && pod install && cd ..
flutter run
```

### Plugin Validation (CocoaPods)

```bash
cd adbrix_plugin
pod lib lint ios/adbrix_plugin.podspec --configuration=Debug --skip-tests --use-modular-headers --use-libraries
```

### Notes

- Flutter 3.44+ uses SPM by default
- Flutter falls back to CocoaPods for dependencies that don't support SPM
- Project-level configuration (`pubspec.yaml`) applies to all contributors
- Global configuration (`flutter config`) applies only to the current user
- [CocoaPods Specs repository becomes read-only on December 2, 2026](https://blog.cocoapods.org/CocoaPods-Specs-Repo/)

## Android Build

```bash
cd adbrix_plugin/example
flutter clean && flutter pub get
flutter run
```

## Publish

```bash
cd adbrix_plugin/example
flutter build appbundle --release     
```

## References

- [Swift Package Manager for plugin authors](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-plugin-authors)
- [Swift Package Manager for app developers](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers)
