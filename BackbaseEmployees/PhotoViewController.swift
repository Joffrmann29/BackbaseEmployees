//
//  PhotoViewController.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var image:UIImage!
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
