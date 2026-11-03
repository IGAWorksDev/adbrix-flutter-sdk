import Flutter
import UIKit
import adbrix_plugin

class SceneDelegate: FlutterSceneDelegate {
    
    // Handle URL scheme deep links
    override func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            AdbrixPlugin.deepLinkOpen(url: context.url)
        }
        super.scene(scene, openURLContexts: URLContexts)
    }
    
    // Handle universal links
    override func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        AdbrixPlugin.deepLinkOpen(userActivity: userActivity)
        super.scene(scene, continue: userActivity)
    }
}
