//
//  AppReducer.swift
//  ReduxDemo
//
//  Created by Eliasz Sawicki on 12/04/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            mainText: mainTextReducer(action, text: state?.mainText),
            inputTextFieldText: inputTextFieldReducer(action, text: state?.inputTextFieldText)
        )
    }
}

func mainTextReducer(action: Action, text: String?) -> String {
    var text = text ?? "initialValue"
    
    switch action {
    case _ as MainTextReset:
        text = ""
    case let action as MainTextChange:
        text = action.text
    default:
        break
    }
    
    return text
}

func inputTextFieldReducer(action: Action, text: String?) -> String {
    var text = text ?? ""
    
    switch action {
    case let action as InputTextFieldChange:
        text = action.text
    default:
        break
    }
    
    return text
}