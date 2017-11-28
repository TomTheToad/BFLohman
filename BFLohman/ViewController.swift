//
//  ViewController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 11/27/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlets
    // BodyWeight
    @IBOutlet weak var bodyWeight: UITextField!
    
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
    
    var textFields: [UITextField]?

    
    // View Triggered Events
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFields()
        
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
            textField.delegate = self
            textField.keyboardType = .decimalPad
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
    }
    
}

