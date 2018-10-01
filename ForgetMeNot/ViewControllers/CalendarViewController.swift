//
//  CalendarViewController.swift
//
//  Created by David Mercado on 9/30/18.
//
//  This file was created by David Mercado and it is used to make a calendar
//Reference: https://github.com/andrewcbancroft/EventTracker/blob/ask-for-permission/EventTracker/ViewController.swift

import UIKit
import EventKit
//import CoreLocation

class CalendarViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate*/ {
    
    //var eventStore : EKEventStore = EKEventStore()
    
    @IBOutlet weak var needPermissionView: UIView!
    @IBOutlet weak var calendarsTableView: UITableView!
    
    //var calendars: [EKCalendar]?
    //var calendar: EKCalendar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.leftBarButtonItem = addButton
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = doneButton
        
        UIApplication.shared.openURL(NSURL(string: "calshow://")! as URL)
    }
    @objc func tapButton(){
        print("YOu tapped!!")
    }
    /*
    //Bool function that checks for calendar authorization----------------------------------
    override func viewWillAppear(_ animated: Bool) {
        checkCalendarAuthorizationStatus()
    }

    //Function that checks calendar authorization-------------------------------------------
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        print("Status is \(status)")
        
        switch (status) {
        case EKAuthorizationStatus.notDetermined:         // This happens on first-run
            print("inside notDetermined")
            requestAccessToCalendar()
            
        case EKAuthorizationStatus.authorized:
            // Things are in line with being able to show the calendars in the table view
            
            print("inside authorized")

            loadCalendars()
            refreshTableView()
            
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            print("inside denied")

            // We need to help them give us permission
            needPermissionView.fadeIn()
        }
    }

    //Function that asks user access to calendar--------------------------------------------
    func requestAccessToCalendar(){
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                /*print("granted \(accessGranted)")
                print("error  \(String(describing: error))")
                
                let event:EKEvent = EKEvent(eventStore: self.eventStore)
                event.title = "Test Title"
                event.startDate = NSDate() as Date
                event.endDate = NSDate() as Date
                event.notes = "This is a note"
                event.calendar = self.eventStore.defaultCalendarForNewEvents
                //eventStore.saveEvent(event, span: EKSpanThisEvent, error: nil)
                print("Saved Event")*/
                
                DispatchQueue.main.async(execute: {
                    self.loadCalendars()
                    self.refreshTableView()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.needPermissionView.fadeIn()
                })
            }
        })
    }

    //Function that loads the users calendar------------------------------------------------
    func loadCalendars() {
        print("inside loadCalendars")
        self.calendars = eventStore.calendars(for: EKEntityType.event)
        }

    //Function that refresh table view
    func refreshTableView() {
        print("inside refreshTableView")

        calendarsTableView.isHidden = false
        calendarsTableView.reloadData()
    }
    
    //Button that allows user to go to setting to allow access to calendar------------------
    @IBAction func goToSettingsButtonTapped(_ sender: UIButton) {
        let openSettingsUrl = URL(string: UIApplication.openSettingsURLString)
        //UIApplication.shared.openURL(openSettingsUrl!)
        UIApplication.shared.open(openSettingsUrl!)
    }
    
    //Table view for calendar---------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let calendars = self.calendars {
            return calendars.count
        }
        return 0
    }
    
    //Table view rows-----------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        if let calendars = self.calendars {
            let calendarName = calendars[(indexPath as NSIndexPath).row].title
            cell.textLabel?.text = calendarName
        } else {
            cell.textLabel?.text = "Unknown Calendar Name"
        }
        
        return cell
    }
    

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2 // This was put in mainly for my own unit testing
    }
*/
 }
