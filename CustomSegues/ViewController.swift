//
//  ViewController.swift
//  CustomSegues
//
//  Created by Quintin Smith on 1/9/15.
//  Copyright (c) 2015 Quintin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    var message: NSString!
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
                
        })
    }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegue" {
            let secondViewController = segue.destinationViewController as SecondViewController
            secondViewController.message = "Hello from the 1st View Controller"
        }
    }
    
    func showSecondViewController()
    {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
        
            }
        }
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
}
    






