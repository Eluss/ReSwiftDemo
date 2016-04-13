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

class MainViewController: UIViewController, StoreSubscriber, UITextFieldDelegate {
    
    static let identifier = "MainViewController"
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!

    override func viewWillAppear(animated: Bool) {
        mainStore.subscribe(self)
        inputTextField.addTarget(self, action: #selector(self.inputTextFieldDidChange(_:)), forControlEvents: .EditingChanged)
    }
    
    override func viewWillDisappear(animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        textLabel.text = state.mainText
        inputTextField.text = state.inputTextFieldText
    }
    
    func inputTextFieldDidChange(sender: UITextField) {
        mainStore.dispatch(InputTextFieldChange(sender.text!))
    }
    
    @IBAction func addTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextChange(inputTextField.text!))
    }
    
    @IBAction func ResetTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextReset())
    }
    
    
    
    
    
    
}