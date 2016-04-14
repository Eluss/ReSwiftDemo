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

class MainViewController: UIViewController, StoreSubscriber, Routable {
    
    static let identifier = "MainViewController"
    var secondViewController: Routable!
    var lastState: AppState!
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
        lastState = state
        textLabel.text = state.mainText
        inputTextField.text = state.inputTextFieldText
    }
    
    func inputTextFieldDidChange(sender: UITextField) {
        mainStore.dispatch(InputTextFieldChange(sender.text!))
    }
    
    @IBAction func addTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextChange(lastState.inputTextFieldText))
    }
    
    @IBAction func ResetTextAction(sender: UIButton) {
        mainStore.dispatch(MainTextReset())
    }
    
    
    @IBAction func nextPageAction(sender: UIButton) {
        mainStore.dispatch(
            SetRouteAction([MainViewController.identifier, SecondViewController.identifier])
        )
    }
    
    func pushRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) -> Routable {
        secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController") as? Routable
        
        presentViewController(secondViewController as! UIViewController, animated: false, completion: completionHandler)
        
        return secondViewController
    }
    
    func popRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) {
        dismissViewControllerAnimated(false, completion: completionHandler)
    }
}