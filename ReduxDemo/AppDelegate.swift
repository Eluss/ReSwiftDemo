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
    typeMaps: [mainControllerActionTypeMap, ReSwiftRouter.typeMap],
    recording: "recording.json"
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var router: Router<AppState>!
    var window: UIWindow?
    
    var mainViewController: UIViewController!
    var secondViewController: UIViewController!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(MainViewController.identifier)
        
        secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(SecondViewController.identifier)
        
        router = Router(store: mainStore, rootRoutable: RootRoutable(routable: mainViewController as! Routable)) { state in
            state.navigationState
        }
        
        mainStore.dispatch{state, store in
            if state.navigationState.route == [] {
                return SetRouteAction([MainViewController.identifier])
            } else {
                return nil
            }
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        mainStore.rewindControlYOffset = 150
        mainStore.window = window
        
        return true
    }
}

class RootRoutable: Routable {
    
    var routable: Routable
    
    init(routable: Routable) {
        self.routable = routable
    }
    
    func pushRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) -> Routable {
        completionHandler()
        return routable
    }
    
    func popRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) {
        completionHandler()
    }
}