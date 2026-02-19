import Flutter
import UIKit
import AdbrixSDK


public class AdbrixPlugin: NSObject, FlutterPlugin, AdbrixDeferredDeepLinkDelegate {
    
    private var pendingResult: FlutterResult?
    private static var isInitialized = false
    private static var pendingDeepLinkURL: URL?
    private static let queue = DispatchQueue(label: "adbrix.sync")
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        
        let channel = FlutterMethodChannel(name: "adbrix_plugin", binaryMessenger: registrar.messenger())
        let instance = AdbrixPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        Adbrix.shared().setDeferredDeepLinkDelegate(instance)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            handleInit(call: call, result: result)
        case "initWithConfig":
            handleInitWithConfig(call: call, result: result)
        case "logEvent":
            handleLogEvent(call: call, result: result)
        case "enableSDK":
            handleEnableSDK(result: result)
        case "disableSDK":
            handleDisableSDK(result: result)
        case "blockDeferredDeepLinkLaunch":
            handleBlockDeferredDeepLinkLaunch(result: result)
        case "attAuthorized":
            handleAttAuthorized(call: call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func handleInit(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let applicationKey = args["applicationKey"] as? String,
              let secretKey = args["secretKey"] as? String else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                                message: "applicationKey and secretKey are required",
                                details: nil))
            return
        }
        Adbrix.shared().sdkInit(
            appkey: applicationKey,
            secretKey: secretKey
        )
        
        AdbrixPlugin.queue.async {
            AdbrixPlugin.isInitialized = true
            if let url = AdbrixPlugin.pendingDeepLinkURL {
                Adbrix.shared().deepLinkOpen(url: url)
            }
            AdbrixPlugin.pendingDeepLinkURL = nil
        }
        
        result(nil)
    }
    
    private func handleInitWithConfig(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let applicationKey = args["applicationKey"] as? String,
              let secretKey = args["secretKey"] as? String else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                                message: "applicationKey and secretKey are required",
                                details: nil))
            return
        }
        var config = args["config"] as? [String: Any] ?? [:]
        if config["ABLogLevel"] != nil {
            config.removeValue(forKey: "setLog")
        }
        
        Adbrix.shared().sdkInit(
            appkey: applicationKey,
            secretKey: secretKey,
            extraConfig: config
        )
        
        AdbrixPlugin.queue.async {
            AdbrixPlugin.isInitialized = true
            if let url = AdbrixPlugin.pendingDeepLinkURL {
                Adbrix.shared().deepLinkOpen(url: url)
            }
            AdbrixPlugin.pendingDeepLinkURL = nil
        }

        result(nil)
    }
    
    private func handleLogEvent(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let eventName = args["eventName"] as? String else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                                message: "eventName is required",
                                details: nil))
            return
        }
        let properties = args["properties"] as? [String: Any] ?? [:]
        
        Adbrix.shared().logEvent(
            name: eventName,
            properties: properties
        )
        
        result(nil)
    }
    
    private func handleEnableSDK(result: @escaping FlutterResult) {
        Adbrix.shared().enableSDK()
        result(nil)
    }
    
    private func handleDisableSDK(result: @escaping FlutterResult) {
        Adbrix.shared().disableSDK()
        result(nil)
    }
    
    private func handleBlockDeferredDeepLinkLaunch(result: @escaping FlutterResult) {
        if pendingResult != nil {
            result(FlutterError(code: "PENDING_RESULT",
                              message: "Another deferred deep link request is pending",
                              details: nil))
            return
        }

        pendingResult = result
    }
    
    private func handleAttAuthorized(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let authorized = args["authorized"] as? Bool else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                                message: "authorized is required",
                                details: nil))
            return
        }
        Adbrix.shared().attAuthorized(authorized)
        result(nil)
    }
    
    public func didReceive(deferredDeepLink: AdbrixDeepLink) {
        guard let deepLink = deferredDeepLink.deepLink, !deepLink.isEmpty else {
            return
        }

        let callback: [String: Any] = [
            "result": deferredDeepLink.result.rawValue,
            "deepLink": deepLink
        ]
        
        if let pendingResult = pendingResult {
            pendingResult(callback)
            self.pendingResult = nil
        } else {
            if let deeplinkURL = URL(string: deepLink) {
                DispatchQueue.main.async {
                    UIApplication.shared.open(deeplinkURL)
                }
            }
        }
    }
    
    @objc
    public static func deepLinkOpen(url: URL) {
        queue.async {
            if isInitialized {
                Adbrix.shared().deepLinkOpen(url: url)
            } else {
                pendingDeepLinkURL = url
            }
        }
    }
    
    @objc
    public static func deepLinkOpen(userActivity: NSUserActivity) {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
           let deepLinkUrl = userActivity.webpageURL {
            queue.async {
                if isInitialized {
                    Adbrix.shared().deepLinkOpen(url: deepLinkUrl)
                } else {
                    pendingDeepLinkURL = deepLinkUrl
                }
            }
        }
    }
}
