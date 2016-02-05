//
//  Employee.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import Foundation
import UIKit

class Employee
{
    var name = ""
    var surName = ""
    var email = ""
    var role = ""
    var photo:UIImage
    var dept = ""
    
    init(name: String, surName: String, email: String, role: String, photo: UIImage, dept: String) {
        self.name = name
        self.surName = surName
        self.email = email
        self.role = role
        self.photo = photo
        self.dept = dept
    }
}