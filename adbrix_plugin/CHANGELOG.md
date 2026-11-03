<details open>
<summary>EN</summary>

## 2.0.0 (2026-10-28)

##### Breaking Changes
- Flutter SDK minimum version upgraded from 1.20.0 to 3.24.0
- Dart SDK minimum version upgraded from 2.12.0 to 3.5.0
- iOS deployment target raised from 12.0 to 15.0 (required by Xcode 27)

##### Added
- Swift Package Manager (SPM) support for iOS dependency management [iOS]
- Package.swift file for SPM-based iOS projects
- Added `play-services-appset` dependency for App Set ID support [Android]
  ```groovy
  implementation("com.google.android.gms:play-services-appset:16.0.2")
  ```

##### Changed
- Android SDK updated to version 4.1.0
- iOS SDK updated to version 3.2.4 (SPM) / 3.2.3 (CocoaPods)

##### Notes
- As [CocoaPods Specs repository has transitioned to Read-only mode](https://blog.cocoapods.org/CocoaPods-Specs-Repo/), Swift Package Manager (SPM) is now recommended for iOS dependency management. SPM provides the latest iOS SDK (3.2.4), while CocoaPods remains available with version 3.2.3.
- Existing iOS projects can continue using CocoaPods or migrate to SPM.

##### Versions

- **Android**
  - Adbrix Android SDK 4.1.0
- **iOS**
  - Adbrix iOS SDK 3.2.4 (Swift Package Manager)
  - Adbrix iOS SDK 3.2.3 (CocoaPods)


## 1.1.2 (2026-02-19)

##### Added
- Added support for SKAdNetwork (SKAN). [iOS]

##### Changed
- Logging system changed [iOS]

##### Fixed
- Fixed an issue in Unity where float values (e.g., 100.0) were incorrectly converted to integers, causing event attributes to be dropped. [Android]
- Resolved a NullPointerException that occurred in unit test environments when null values were passed as inputs. [Android]
- Fixed an intermittent issue where queued events were excluded from transmission during consecutive event calls. [Android]

##### Notes
- Event sampling now applies to all events. [Android]
- Standardized inconsistent log structures and messages across all platforms into a single format. [Android]

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.10
- **iOS**
  - Adbrix iOS SDK 3.2.1


## 1.1.1 (2025-11-06)

##### Added
- Added support for SKAdNetwork (SKAN). [iOS]

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.7
- **iOS**
  - Adbrix iOS SDK 3.1.0


## 1.0.6 (2025-09-02)

##### Fixed
- Fixed validation issue where invalid event property types were allowed. [iOS]

##### Enhancement
- Improving Event Collection Stability and Collection Rate [Android]

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.7
- **iOS**
  - Adbrix iOS SDK 3.0.3


## 1.0.5 (2025-07-01)

##### Notes

- Updated the Adbrix Android SDK from 3.0.4 to 3.0.5.

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.5
- **iOS**
  - Adbrix iOS SDK 3.0.2


## 1.0.4 (2025-06-18)

##### Fixed

- Fixed an issue where item properties were missing when delivering items with custom key-value pairs on iOS.

##### Notes

- Updated the Adbrix iOS SDK from 3.0.1 to 3.0.2.

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.4
- **iOS**
  - Adbrix iOS SDK 3.0.2


## 1.0.3 (2025-06-13)

##### Added
- [FlutterFragmentActivity](https://api.flutter.dev/javadoc/io/flutter/embedding/android/FlutterFragmentActivity.html) is now supported.

##### Fixed
- Fixed an issue where google advertising id might not be collected on Android.

##### Notes

- Updated the Adbrix Android SDK from 3.0.3 to 3.0.4.

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.4
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.2 (2025-06-10)

##### Fixed
- Fixed the issue where Double type event properties would be missing when appending `.0` to the end.

##### Notes

- Updated the Adbrix Android SDK from 3.0.2 to 3.0.3.

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.3
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.1 (2025-06-05)

##### Notes

- Updated the Adbrix Android SDK from 3.0.1 to 3.0.2.

##### Versions

- **Android**
  - Adbrix Android SDK 3.0.2
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.0 (2025-06-02)

##### Notes

- Initial release

##### Versions

- **Android**
    - Adbrix Android SDK 3.0.1
- **iOS**
    - Adbrix iOS SDK 3.0.1

</details>

<details open>
<summary>KO</summary>




## 2.0.0 (2026-10-28)

##### 주요 변경사항 (Breaking Changes)
- Flutter SDK 최소 버전이 1.20.0에서 3.24.0으로 업그레이드되었습니다.
- Dart SDK 최소 버전이 2.12.0에서 3.5.0으로 업그레이드되었습니다.
- iOS deployment target이 12.0에서 15.0으로 상향되었습니다. (Xcode 27 요구사항)

##### 추가됨
- iOS 의존성 관리를 위한 Swift Package Manager(SPM) 지원이 추가되었습니다. [iOS]
- SPM 기반 iOS 프로젝트를 위한 Package.swift 파일 추가
- App Set ID 지원을 위한 `play-services-appset` 의존성 추가 [Android]
  ```groovy
  implementation("com.google.android.gms:play-services-appset:16.0.2")
  ```

##### 변경됨
- Android SDK가 버전 4.1.0으로 업데이트되었습니다.
- iOS SDK가 버전 3.2.4 (SPM) / 3.2.3 (CocoaPods)으로 업데이트되었습니다.

##### 주요 사항
- [CocoaPods Specs 저장소가 Read-only 모드로 전환](https://blog.cocoapods.org/CocoaPods-Specs-Repo/)됨에 따라, iOS 의존성 관리에 Swift Package Manager(SPM) 사용을 권장합니다. SPM을 통해 최신 iOS SDK(3.2.4)를 사용할 수 있으며, CocoaPods는 버전 3.2.3까지 지원됩니다.
- 기존 iOS 프로젝트는 CocoaPods를 계속 사용하거나 SPM으로 마이그레이션할 수 있습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 4.1.0
- **iOS**
  - Adbrix iOS SDK 3.2.4 (Swift Package Manager)
  - Adbrix iOS SDK 3.2.3 (CocoaPods)


## 1.1.2 (2026-02-19)

##### 추가됨
- SKAdNetwork(SKAN) 기능이 추가되었습니다. [iOS]

##### 변경됨
- 로깅 시스템 변경 [iOS]

##### 고쳐짐
- Unity에서 100.0과 같은 실수형 데이터가 정수형으로 변환되어 이벤트 속성에서 누락되던 타입을 수정하였습니다. [Android]
- 유닛 테스트 환경에서 null 값이 입력될 경우 NullPointerException이 발생하던 문제를 해결하였습니다. [Android]
- 연속적인 이벤트 발생 시, 메모리 큐에 대기 중인 이벤트가 발송 대상에서 간헐적으로 누락되던 문제를 해결하였습니다. [Android]

##### 주요 사항
- 이벤트 샘플링이 모든 이벤트에 적용되도록 변경되었습니다. [Android]
- 플랫폼별로 상이했던 로그 구조와 메시지가 통일된 규격으로 변경되었습니다. [Android]

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.10
- **iOS**
  - Adbrix iOS SDK 3.2.1


## 1.1.0 (2025-11-06)

##### 추가됨
- SKAdNetwork(SKAN) 기능이 추가되었습니다. [iOS]

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.7
- **iOS**
  - Adbrix iOS SDK 3.1.0


## 1.0.6 (2025-09-02)

##### 고쳐짐
- 검증에 통과되지 않아야 하는 이벤트 프로퍼티의 타입이 통과되던 문제 수정 [iOS]

##### 개선
- 이벤트 수집 안정성 및 수집률 향상 [Android]

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.7
- **iOS**
  - Adbrix iOS SDK 3.0.3


## 1.0.5 (2025-07-01)

##### 주요 사항

- Adbrix Android SDK가 3.0.4에서 3.0.5로 변경되었습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.5
- **iOS**
  - Adbrix iOS SDK 3.0.2


## 1.0.4 (2025-06-18)

##### 고쳐짐

- iOS에서 상품(Item) 전달 시 커스텀 키 밸류값이 들어가면 누락되는 문제를 해결했습니다.

##### 주요 사항

- Adbrix iOS SDK가 3.0.1에서 3.0.2로 변경되었습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.4
- **iOS**
  - Adbrix iOS SDK 3.0.2


## 1.0.3 (2025-06-13)

##### 추가됨
- [FlutterFragmentActivity](https://api.flutter.dev/javadoc/io/flutter/embedding/android/FlutterFragmentActivity.html)가 지원됩니다.

##### 고쳐짐

- Android에서 광고 식별자가 수집되지 않을수 있는 문제가 해결되었습니다.

##### 주요 사항

- Adbrix Android SDK가 3.0.3에서 3.0.4로 변경되었습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.4
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.2 (2025-06-10)

##### 고쳐짐

- Double 타입 이벤트 속성 끝에 `.0`을 붙일 경우 누락되는 문제를 해결했습니다.

##### 주요 사항

- Adbrix Android SDK가 3.0.2에서 3.0.3로 변경되었습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.3
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.1 (2025-06-05)

##### 주요 사항

- Adbrix Android SDK가 3.0.1에서 3.0.2로 변경되었습니다.

##### 버전 정보

- **Android**
  - Adbrix Android SDK 3.0.2
- **iOS**
  - Adbrix iOS SDK 3.0.1


## 1.0.0 (2025-06-02)

##### 주요 사항

- 최초 배포

##### 버전 정보

- **Android**
    - Adbrix Android SDK 3.0.1
- **iOS**
    - Adbrix iOS SDK 3.0.1

</details>
