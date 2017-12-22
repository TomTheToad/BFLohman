//
//  Record.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/21/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import Foundation

struct Record {
    
    /* Fields */
    
    // Basic Info
    var name: String?
    var gender: String?
    var weight: Float?
    
    // Calculated Fields
    var bodyFatPecentage: Float?
    var minWeight: Float?
    
    // Measurements
    
    // Abdomen
    var ab1: Float?
    var ab2: Float?
    var ab3: Float?
    
    // Tricep
    var tri1: Float?
    var tri2: Float?
    var tri3: Float?
    
    // Subscapularis
    var scap1: Float?
    var scap2: Float?
    var scap3: Float?
}
