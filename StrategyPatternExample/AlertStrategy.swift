//
//  AlertStrategy.swift
//  StrategyPatternExample
//
//  Created by monitora on 02/09/19.
//  Copyright © 2019 Haroldo Leite. All rights reserved.
//

import Foundation
import UIKit

protocol AlertCallbackDelegate {
    func resultOption(action: UIAlertAction)
}

// What
protocol AlertStrategy {
    func launchAlert(_ title: String,_ message: String,_ delegate: AlertCallbackDelegate) -> UIAlertController
}

// Who
struct Alert {
    let strategy: AlertStrategy
    let delegate: AlertCallbackDelegate?
    
    func createAlert(title: String, message: String) -> UIAlertController? {
        if let deleg = delegate {
            let alert = strategy.launchAlert(title, message, deleg)
            return alert
        }
        
        return nil
    }
}

// How
struct JustOkOptionStrategy: AlertStrategy {
    func launchAlert(_ title: String,_ message: String,_ delegate: AlertCallbackDelegate) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            delegate.resultOption(action: action)
        }
        
        alert.addAction(action)
        
        return alert
    }
}

struct TwoOptionsStrategy: AlertStrategy {
    func launchAlert(_ title: String,_ message: String,_ delegate: AlertCallbackDelegate) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionConfirm = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(actionConfirm)
        alert.addAction(actionCancel)
        
        return alert
    }
}
