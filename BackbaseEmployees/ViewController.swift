//
//  ViewController.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EmployeeDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var actIndicator: UIActivityIndicatorView!
    var employees = [Employee]()
    let manager = EmployeeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.getLatestLoans()
        tableView.dataSource = self
        tableView.delegate = self
        self.actIndicator.startAnimating()
        self.actIndicator.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:return manager.launchpads.count
        case 1:return manager.cxps.count
        case 2:return manager.mobiles.count
        default:return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("empCell", forIndexPath: indexPath)
        switch(indexPath.section){
        case 0: let launchpadEmp = manager.launchpads[indexPath.row] as! Employee
                cell.textLabel!.text = launchpadEmp.name
                cell.detailTextLabel?.text = launchpadEmp.surName
                cell.imageView?.image = launchpadEmp.photo
        case 1: let cxpEmp = manager.cxps[indexPath.row] as! Employee
                cell.textLabel?.text = cxpEmp.name
                cell.detailTextLabel?.text = cxpEmp.surName
                cell.imageView?.image = cxpEmp.photo
        case 2: let mobileEmp = manager.mobiles[indexPath.row] as! Employee
                cell.textLabel?.text = mobileEmp.name
                cell.detailTextLabel?.text = mobileEmp.surName
                cell.imageView?.image = mobileEmp.photo
        default: break
        }
        
        return cell
    }
    
    // Delegate method from EmployeeDelegate protocol
    func reloadTable() {
        self.tableView.reloadData()
        self.actIndicator.stopAnimating()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section)
        {
        case 0:return manager.sectionNames[0]
        case 1:return manager.sectionNames[1]
        case 2:return manager.sectionNames[2]
        default:return ""
    }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "empDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            let detailController = segue.destinationViewController as! EmployeeDetailViewController
            switch(indexPath!.section){
            case 0:let launchpadEmp = manager.launchpads[indexPath!.row]
                    detailController.passedEmployee = launchpadEmp as! Employee
            case 1: let cxpEmp = manager.cxps[indexPath!.row]
                    detailController.passedEmployee = cxpEmp as! Employee
            case 2:let mobile = manager.mobiles[indexPath!.row]
                    detailController.passedEmployee = mobile as! Employee
            default: break
            }
        }
    }
}

