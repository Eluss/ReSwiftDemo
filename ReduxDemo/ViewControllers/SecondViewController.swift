//
//  SecondViewController.swift
//  ReduxDemo
//
//  Created by Eliasz Sawicki on 14/04/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import ReSwiftRouter

class SecondViewController: UIViewController, Routable {
    
    static let identifier = "SecondViewController"
    
    @IBAction func backAction(sender: UIButton) {
        mainStore.dispatch(
            SetRouteAction(["MainViewController"])
        )
    }
}