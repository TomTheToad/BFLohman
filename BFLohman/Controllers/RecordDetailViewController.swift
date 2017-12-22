//
//  RecordDetailViewController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/21/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

class RecordDetailViewController: UIViewController {
    
    /* IBOutlets */
    // General Stats
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // Calculated Results
    @IBOutlet weak var bodyFatLabel: UILabel!
    @IBOutlet weak var minWeightLabel: UILabel!
    
    /* Measurements */
    
    // Abdomen
    @IBOutlet weak var ab1Label: UILabel!
    @IBOutlet weak var ab2Label: UILabel!
    @IBOutlet weak var ab3Label: UILabel!
    
    // Tricep
    @IBOutlet weak var tri1Label: UILabel!
    @IBOutlet weak var tri2Label: UILabel!
    @IBOutlet weak var tri3Label: UILabel!
    
    // Subscapularis
    @IBOutlet weak var scap1Label: UILabel!
    @IBOutlet weak var scap2Label: UILabel!
    @IBOutlet weak var scap3Label: UILabel!
    
}
