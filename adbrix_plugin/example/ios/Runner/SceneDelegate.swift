import Flutter
import UIKit
import adbrix_plugin

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        window?.rootViewController = flutterViewController
        window?.makeKeyAndVisible()
    }
    
    // Handle URL scheme deep links
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            AdbrixPlugin.deepLinkOpen(url: context.url)
        }
    }
    
    // Handle universal links
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        AdbrixPlugin.deepLinkOpen(userActivity: userActivity)
    }
}
