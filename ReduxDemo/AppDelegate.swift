//
//  AppDelegate.swift
//  ReduxDemo
//
//  Created by Eliasz Sawicki on 12/04/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

var mainStore = Store<AppState>(
    reducer: AppReducer(),
    state: nil
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var router: Router<AppState>!
    var window: UIWindow?

    var mainViewController: UIViewController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController")
        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}