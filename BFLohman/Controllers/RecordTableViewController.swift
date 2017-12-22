//
//  RecordTableViewController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/21/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit

class RecordTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Fields
    // TODO: update this
    var data: [Record]? {
        didSet {
            // update this
            recordTableView.reloadData()
        }
    }
    
    // IBOutlets
    @IBOutlet weak var recordTableView: UITableView!
    
    // View Triggered Events
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTableView.delegate = self
        recordTableView.dataSource = self
    }
    
    // Required Table Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = data?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "record", for: indexPath) as! RecordTableCell
        guard let thisData = data else {
            return cell
        }
        
        let record = thisData[indexPath.row]
        
        guard let name = record.name else {
            return cell
        }
        
        cell.nameLabel.text = name
        
        return cell
    }
    
    func deleteRecord(record: Record) {
        // TODO: call coreData delete record
    }
    
}
