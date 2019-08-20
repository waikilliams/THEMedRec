//
//  ScheduleTableViewController.swift
//  THEMedRec
//
//  Created by Williams, Kai on 8/20/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import Firebase

class ScheduleTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "calendarIcon")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: #selector(seg2CalendarView))
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func seg2CalendarView() {
        performSegue(withIdentifier: "seg2Calendar", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
