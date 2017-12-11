//
//  MainViewController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 11/27/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate, KeyboardButtonsDelegate, customButtonViewDelegate {
    
    // IBOutlets
    @IBOutlet weak var bodyWeight: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    
    // Abdomen
    @IBOutlet weak var ab1TextField: UITextField!
    @IBOutlet weak var ab2TextField: UITextField!
    @IBOutlet weak var ab3TextField: UITextField!
    
    // Tricep
    @IBOutlet weak var tri1TextField: UITextField!
    @IBOutlet weak var tri2TextField: UITextField!
    @IBOutlet weak var tri3TextField: UITextField!
    
    // SubScap
    @IBOutlet weak var scap1TextField: UITextField!
    @IBOutlet weak var scap2TextField: UITextField!
    @IBOutlet weak var scap3TextField: UITextField!
    
    // Output Fields (body fat and min weight)
    @IBOutlet weak var bodyFat: UILabel!
    @IBOutlet weak var minWeight: UILabel!
    
    // IB Actions
    @IBAction func clearButton(_ sender: Any) {
        clearTextFields()
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        setBodyFat()
    }
    
    // Calculated Fields
    var abdomenAVG: Float {
        let first = Float(ab1TextField.text ?? "0") ?? 0
        let second = Float(ab2TextField.text ?? "0") ?? 0
        let third = Float(ab3TextField.text ?? "0") ?? 0
        return (first + second + third) / 3
    }
    
    var tricepAVG: Float {
        let first = Float(tri1TextField.text ?? "0") ?? 0
        let second = Float(tri2TextField.text ?? "0") ?? 0
        let third = Float(tri3TextField.text ?? "0") ?? 0
        return (first + second + third) / 3
    }
    
    var subscapularisAVG: Float {
        let first = Float(scap1TextField.text ?? "0") ?? 0
        let second = Float(scap2TextField.text ?? "0") ?? 0
        let third = Float(scap3TextField.text ?? "0") ?? 0
        return (first + second + third) / 3
    }
    
    var sumOfSkinFolds: Float {
        return abdomenAVG + tricepAVG + subscapularisAVG
    }
    
    // Fields
    var textFields: [UITextField]?
    var currentTextField: UITextField?

    
    // View Triggered Events
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFields()
        clearButton.layer.cornerRadius = clearButton.frame.size.height/2
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    // Add delegate and keyboard type
    func setUpTextFields() {
        textFields = [ab1TextField, ab2TextField, ab3TextField, tri1TextField, tri2TextField, tri3TextField, scap1TextField, scap2TextField, scap3TextField, bodyWeight]
        
        guard let textFields = textFields else {
            return
        }
        
        for textField in textFields {
            guard let KBView = storyboard?.instantiateViewController(withIdentifier: "KeyboardButtons") as? KeyboardButtonsController else {
                print("Error locating KeyboardController")
                return
            }
            
            KBView.buttondelegate = self
            
            guard let thisView = KBView.view as? KeyboardButtonsView else {
                print("could not instantiate the view")
                return
            }
            
            textField.delegate = self
            thisView.viewDelegate = self
            textField.keyboardType = .decimalPad
            textField.inputAccessoryView = thisView
        }
    }
    
    func clearTextFields() {
        guard let textFields = textFields else {
            return
        }
        
        for textfield in textFields {
            textfield.text = ""
        }
        
        bodyFat.text = "00"
        minWeight.text = "00"
    }
    
    func calculateBodyDensity() -> Float {
        return (1.0973 - (sumOfSkinFolds * 0.000815)) + (sumOfSkinFolds * 0.00000084)
    }

    func calculateBodyFatPercentage(bodyDensity: Float) -> Float {
        return (457 / bodyDensity) - 414.2
    }
    
    func setBodyFat() {
        let bodyDensity = calculateBodyDensity()
        let bodyFatPercentage = calculateBodyFatPercentage(bodyDensity: bodyDensity)
        
        bodyFat.text = "\(bodyFatPercentage)"
        
        setMinWeight(bodyFatPercentage: bodyFatPercentage)
    }
    
    func setMinWeight(bodyFatPercentage: Float) {
        guard let bodyWeight = Float(bodyWeight.text!) else {
            return
        }
        
        let min = ((1 - (bodyFatPercentage / 100)) * bodyWeight) / (0.93)
        
        minWeight.text =  "\(min)"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        minWeight.text = "00"
        bodyFat.text = "00"
        currentTextField = textField
    }
    
    // KeyboardButtonsDelegate required methods
    func nextTextField() {
        print("next func reached")
        
        guard let textField = currentTextField else {
            return
        }
        
        guard let count = textFields?.count else {
            return
        }
        
        if textField.tag < count {
            if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) {
                nextTextField.becomeFirstResponder()
            }
            
        }
        
    }
    
    func calculate() {
        print("calculate func reached")
        setBodyFat()
    }
    
    func previousTextField() {
        print("previous func reached")
        guard let textField = currentTextField else {
            return
        }
        
        if textField.tag < 0 {
            if let previousTextField = textField.superview?.viewWithTag(textField.tag - 1) {
                previousTextField.becomeFirstResponder()
            }
            
        }
        
    }
}

