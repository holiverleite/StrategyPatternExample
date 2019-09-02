//
//  ViewController.swift
//  StrategyPatternExample
//
//  Created by monitora on 02/09/19.
//  Copyright © 2019 Haroldo Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alertStrategy = Alert(strategy: TwoOptionsStrategy(), delegate: self)
        if let alertComponent = alertStrategy.createAlert(title: "Titulo - Only Ok", message: "Press OK to finish!") {
            self.present(alertComponent, animated: true, completion: nil)
        }
    }
}

extension ViewController: AlertCallbackDelegate {
    func resultOption(action: UIAlertAction) {
        print("")
    }
}

