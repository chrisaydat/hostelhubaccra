import UIKit
import Flutter
import GoogleMaps
// import shared_preferences_foundation
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()

        // Provide the API key for Google Maps services
        GMSServices.provideAPIKey("AIzaSyDrfIUPwzBRz3uBvIBOmTnVeaM0ZHi5fUc")

        // Register generated plugins
        GeneratedPluginRegistrant.register(with: self)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}