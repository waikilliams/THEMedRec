//
//  ViewController.swift
//  IOSAddEventTutorial
//
//  Created by Arthur Knopper on 11/11/2018.
//  Copyright © 2018 Arthur Knopper. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let eventStore = EKEventStore()
        
        ///////////////////////////////////////////////////////////////////////////////////////
        
        
        
        
        /////////////////////////////////////////////////////////////////////////////////////////
        
        // 2
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            let newCalendar = EKCalendar(for: .event, eventStore: eventStore)
            
            newCalendar.title = "MedRec Schedule"
            
            let sourcesInEventStore = eventStore.sources
            
            newCalendar.source = sourcesInEventStore.filter{
                (source: EKSource) -> Bool in
                source.sourceType.rawValue == EKSourceType.local.rawValue
                }.first!
            
            do {
                try eventStore.saveCalendar(newCalendar, commit: true)
                UserDefaults.standard.set(newCalendar.calendarIdentifier, forKey: "EventTrackerPrimaryCalendar")
            } catch {
                let alert = UIAlertController(title: "Calendar could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OKAction)
                
                self.present(alert, animated: true, completion: nil)
            }
            insertEvent(store: eventStore)
            case .denied:
            print("Access denied")
            case .notDetermined:
            // 3
                eventStore.requestAccess(to: .event, completion:
            
                {[weak self] (granted: Bool, error: Error?) -> Void in
                    if granted {
                        self!.insertEvent(store: eventStore)
                    } else {
                        print("Access denied")
                    }
                })
            default:
                print("Case default")
        }
    }
    
    func insertEvent(store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: .event)
        
        for calendar in calendars {
            // 2
            if calendar.title == "MedRec Schedule" {
                // 3
                let startDate = Date()
                // 2 hours
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                
                // 4
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                
                event.title = "New Meeting"
                event.startDate = startDate
                event.endDate = endDate
                
                // 5
                do {
                    try store.save(event, span: .thisEvent)
                }
                catch {
                    print("Error saving event in calendar")
                }
            }
        }
    }

}

