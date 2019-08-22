////
////  CalendarViewController.swift
////  THEMedRec
////
////  Created by Zofchak, Robert on 7/8/19.
////  Copyright © 2019 Williams, Kai. All rights reserved.
////
//
import UIKit
import Firebase
import EventKit



class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var calendars: [EKCalendar]?
    
    let eventStore = EKEventStore()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
