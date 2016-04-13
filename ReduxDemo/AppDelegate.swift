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
import ReSwiftRecorder

var mainStore = RecordingMainStore<AppState>(
    reducer: AppReducer(),
    state: nil,
    typeMaps: [mainControllerActionTypeMap],
    recording: "recording.json"
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
        
        mainStore.rewindControlYOffset = 150
        mainStore.window = window
        
        return true
    }

}