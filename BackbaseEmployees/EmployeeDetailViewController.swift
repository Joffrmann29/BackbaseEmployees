//
//  EmployeeDetailViewController.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import UIKit
import MessageUI

class EmployeeDetailViewController: UITableViewController, UIGestureRecognizerDelegate, MFMailComposeViewControllerDelegate{

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    var passedEmployee:Employee!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.darkGrayColor()
        print(passedEmployee.name)
        imgView.image = passedEmployee.photo
        nameLabel.text = String(format: "Name: %@ %@", passedEmployee.name, passedEmployee.surName)
        departmentLabel.text = String(format: "Department: %@", passedEmployee.dept)
        roleLabel.text = String(format: "Role: %@", passedEmployee.role)
        tableView.scrollEnabled = false
        imgView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        imgView.addGestureRecognizer(tap)
        tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        performSegueWithIdentifier("showPhoto", sender: self)
    }
    
    // MFMailComposeViewControllerDelegate
    
    // 1
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
        switch (result)
        {
        case MFMailComposeResultCancelled:
            print("Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            print("Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            print("Mail sent");
            successAlert()
            break;
        case MFMailComposeResultFailed:
            print("Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            print("Mail not sent.");
            break;
        }
    }
    
    func successAlert() {
        let successAlert = UIAlertController(title: "Success", message: "Your e-mail has been sent successfully.", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        successAlert.addAction(defaultAction)
        self.presentViewController(successAlert, animated: true, completion: nil)
    }

    @IBAction func sendMail(sender: UIBarButtonItem) {
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPhoto" {
            let photoController = segue.destinationViewController as! PhotoViewController
            photoController.image = imgView.image
        }
    }
}
