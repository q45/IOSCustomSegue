//
//  SecondViewController.swift
//  CustomSegues
//
//  Created by Quintin Smith on 1/9/15.
//  Copyright (c) 2015 Quintin Smith. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    var message: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        lblMessage.text = message

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegueUnwind" {
            let firstViewController = segue.destinationViewController as ViewController
            firstViewController.lblMessage.text = "You just came back from the 2nd VC"
        }
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
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
