//
//  ViewController.swift
//  StartUpScreen
//
//  Created by 90301422 on 1/22/19.
//  Copyright © 2019 Nico D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whiteBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var stopRun = 1
        
        if stopRun == 1 {
            stopRun = stopRun + 1
            UIView.animate(withDuration: 3, animations: {
                self.whiteBox.transform = CGAffineTransform(translationX: 400, y: -1)
            }, completion: nil)
            
        }
        
        func topMostController() -> UIViewController {
            var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
            while (topController.presentedViewController != nil) {
                topController = topController.presentedViewController!
            }
            return topController
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
            if stopRun == 2 {
                topMostController().performSegue(withIdentifier: "mySegue", sender: topMostController())
                stopRun = stopRun + 1
                
            }
        }
        
    }
    
}
