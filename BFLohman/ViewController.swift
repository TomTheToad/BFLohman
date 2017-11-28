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
    @IBOutlet weak var bodyWeight: UITextField!
    @IBOutlet weak var abdomen: UITextField!
    @IBOutlet weak var tricep: UITextField!
    @IBOutlet weak var subscapularis: UITextField!
    
    @IBOutlet weak var bodyFat: UILabel!
    @IBOutlet weak var minWeight: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        setBodyFat()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyWeight.delegate = self
        abdomen.delegate = self
        tricep.delegate = self
        subscapularis.delegate = self
        
        bodyWeight.keyboardType = .numberPad
        abdomen.keyboardType = .numberPad
        tricep.keyboardType = .numberPad
        subscapularis.keyboardType = .numberPad
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    func calculateBodyDensity(sumOfMeasurements: Float) -> Float {
        return (1.0973 - (sumOfMeasurements * 0.000815)) + (sumOfMeasurements * 0.00000084)
    }

    func calculateBodyFatPercentage(bodyDensity: Float) -> Float {
        return (457 / bodyDensity) - 414.2
    }
    
    func setBodyFat() {
        
        guard let thisAB = abdomen.text else {
            return
        }
        
        guard let thisTri = tricep.text else {
            return
        }
        
        guard let thisSubscap = subscapularis.text else {
            return
        }
        
        guard let ab = Float(thisAB) else {
            return
        }
        
        guard let tri = Float(thisTri) else {
            return
        }
        
        guard let subscap = Float(thisSubscap) else {
            return
        }
        
        let bodyDensity = calculateBodyDensity(sumOfMeasurements: ab + tri + subscap)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bodyWeight.text = ""
        bodyFat.text = ""
    }
    
}

