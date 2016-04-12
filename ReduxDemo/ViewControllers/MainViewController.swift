//
//  MainViewController.swift
//  ReduxDemo
//
//  Created by Eliasz Sawicki on 12/04/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

class MainViewController: UIViewController, StoreSubscriber {
    
    static let identifier = "MainViewController"
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    
    
    @IBAction func addTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextChange(inputTextField.text!))
    }
    
    @IBAction func ResetTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextReset())
    }
    
    func newState(state: AppState) {
        textLabel.text = state.mainText
    }
    
    override func viewWillAppear(animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
}