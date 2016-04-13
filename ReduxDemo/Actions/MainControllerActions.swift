//
//  MainTextActions.swift
//  ReduxDemo
//
//  Created by Eliasz Sawicki on 12/04/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRecorder

let mainControllerActionTypeMap: TypeMap = [MainTextReset.type: MainTextReset.self,
                                      MainTextChange.type: MainTextChange.self,
                                      InputTextFieldChange.type: InputTextFieldChange.self]

struct MainTextReset: StandardActionConvertible {
    static let type = "MAIN_TEXT_RESET"
    init() {}
    init(_ standardAction: StandardAction) {}
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: MainTextReset.type, payload: [:], isTypedAction: true)
    }
}

struct InputTextFieldChange: StandardActionConvertible {
    static let type = "INPUT_TEXT_CHANGE"
    let text: String
    init(_ text: String) {
        self.text = text
    }
    
    init(_ standardAction: StandardAction) {
        self.text = standardAction.payload!["text"] as! String
    }
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: InputTextFieldChange.type, payload: ["text": text], isTypedAction: true)
    }
    
}

struct MainTextChange {
    static let type = "MAIN_TEXT_CHANGE"
    let text: String
    init(_ text: String) {
        self.text = text
    }
}

extension MainTextChange: StandardActionConvertible {
    init(_ standardAction: StandardAction) {
        self.text = standardAction.payload!["text"] as! String
    }
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: MainTextChange.type, payload: ["text": text], isTypedAction: true)
    }
}

