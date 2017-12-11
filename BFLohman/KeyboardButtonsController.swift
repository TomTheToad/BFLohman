//
//  KeyboardButtonsController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/8/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

protocol KeyboardButtonsDelegate {
    func previousTextField()
    func calculate()
    func nextTextField()
}

class KeyboardButtonsController: UIViewController {
    
    var buttondelegate: KeyboardButtonsDelegate!
    
    @IBAction func previousButtonAction(_ sender: Any) {
        // print("previous button clicked")
        // buttondelegate.previousTextField()
    }
    @IBAction func calculateButtonAction(_ sender: Any) {
        // print("calculate button clicked")
        // buttondelegate.calculate()
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        // print("next button clicked")
        // buttondelegate.nextTextField()
    }
}
