//
//  EmployeeManager.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import Foundation
import UIKit

@objc protocol EmployeeDelegate {
    func reloadTable()
}

class EmployeeManager
{
    let backbaseEmpURL = "http://nielsmouthaan.nl/backbase/members.php"
    var delegate = EmployeeDelegate?()
    
    var employees = [Employee]()
    var sectionNames = ["Launchpad", "CXP", "Mobile"]
    var launchpads = []
    var cxps = []
    var mobiles = []
    var img:UIImage! = UIImage()
    
    func getLatestLoans() {        
        let request = NSURLRequest(URL: NSURL(string: backbaseEmpURL)!)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData(data)
                // Reload table view
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.delegate?.reloadTable()
                })
            }
        })
        task.resume()
    }
    
    func parseJsonData(data: NSData) {
        do {
             if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data,
                options: NSJSONReadingOptions.MutableContainers) as? NSDictionary{
            
                    // Parse JSON data
                    let launchpads = parseEmployeeType("Launchpad", jsonResult: jsonResult)
                    let cxps = parseEmployeeType("CXP", jsonResult: jsonResult)
                    let mobiles = parseEmployeeType("Mobile", jsonResult: jsonResult)
                    
                    self.launchpads = launchpads
                    self.cxps = cxps
                    self.mobiles = mobiles
            }
        } catch {
            print(error)
        }
    }
    
    func parseEmployeeType(type: String, jsonResult: NSDictionary) -> [Employee] {
        let emps = jsonResult[type] as! [AnyObject]
        var employees = [Employee]()
        for json in emps {
            let name = json["name"] as! String
            let surName = json["surname"] as! String
            let email = json["email"] as! String
            let role = json["role"] as! String
            var photo:UIImage = UIImage()
            var photoFromWeb:UIImage = UIImage()
            var employee: Employee
            
            //var employee:Employee
            if let photoName = json["photo"] as? String{
                let backbaseImgURL = String(format: "http://nielsmouthaan.nl/backbase/photos/%@", photoName)
                photoFromWeb = getImageForName(backbaseImgURL)
                employee = Employee(name: name, surName: surName, email: email, role: role, photo: photoFromWeb, dept: type)
            }
                    
            else {
                photo = UIImage(named: "employee.png")!
                employee = Employee(name: name, surName: surName, email: email, role: role, photo: photo, dept: type)
            }
            
            employees.append(employee)
        }
        
        return employees
    }
    
    func getImageForName(urlString: String) -> UIImage {
        let url = NSURL(string: urlString)
        
        if let data = NSData(contentsOfURL: url!) {
            img = UIImage(data: data)
        }
        
    
        return img
    }
    
    func resizeImage(imageToResize: UIImage) -> UIImage {
        let rect = CGRectMake(0, 0, 75, 75)
        UIGraphicsBeginImageContext(rect.size)
        imageToResize.drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageData = UIImagePNGRepresentation(image)
        let finalImg = UIImage(data: imageData!)
        
        return finalImg!
    }
}