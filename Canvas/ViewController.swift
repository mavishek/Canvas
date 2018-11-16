//
//  ViewController.swift
//  Canvas
//
//  Created by Avishek Thapa Magar on 11/15/18.
//  Copyright © 2018 Avishek Thapa Magar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayDownOffset = 160
        trayUp = trayView.center // The initial position of the tray
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset) // The position of the tray transposed down
    }

    @IBAction func trayView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if (sender.state == .began) {
            trayOriginalCenter = trayView.center
        }
        if (sender.state == .changed) {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        }
        if (sender.state == .ended) {
            let velocity = sender.velocity(in: view)
            if (velocity.y > 0) {
                //moving down
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options:[] , animations: {
                    self.trayView.center = self.trayDown
                });
                
            } else if (velocity.y < 0) {
                //moving up
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options:[] , animations: {
                    self.trayView.center = self.trayUp
                });
    
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

