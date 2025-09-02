import Flutter
import UIKit

import adbrix_plugin

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        AdbrixPlugin.deepLinkOpen(url: url)
        
        return super.application(app, open: url, options: options)
    }
    
    override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        
        AdbrixPlugin.deepLinkOpen(userActivity: userActivity)
        
        return super.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }
}
