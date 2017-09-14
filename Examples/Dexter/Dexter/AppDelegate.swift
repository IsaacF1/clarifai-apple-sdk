//
//  AppDelegate.swift
//  Dexter
//
//  Copyright © 2017 Clarifai Inc. All rights reserved.
//

import UIKit
import Clarifai_Apple_SDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let APIKey = "<Your API Key>"
        Clarifai.sharedInstance().start(apiKey: APIKey)

        if APIKey == "<Your API Key>" {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "NO API Key FOUND", message: "Add API Key and re-install", preferredStyle: .alert)
                self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
        return true
    }
}
