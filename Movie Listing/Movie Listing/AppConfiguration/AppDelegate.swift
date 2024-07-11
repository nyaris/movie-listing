import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: HomeFactory.make())
        let window = UIWindow()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
        return true
    }
}
