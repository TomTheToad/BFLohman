//
//  KeyboardButtonsView.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/11/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

protocol customButtonViewDelegate {
    func previousTextField()
    func calculate()
    func nextTextField()
}

class KeyboardButtonsView: UIView {
    
    var viewDelegate: customButtonViewDelegate!
    
    @IBAction func previousButtonAction(_ sender: Any) {
        viewDelegate.previousTextField()
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        viewDelegate.calculate()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        viewDelegate.nextTextField()
    }
}
