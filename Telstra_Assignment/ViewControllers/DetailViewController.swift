//
//  DetailViewController.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/23/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
        var colorArray: [AnyObject]?
        let gradientLayer = CAGradientLayer()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let customView = DetailView(frame: self.view.frame)
            self.view.addSubview(customView)
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.viewTapped))
            view.addGestureRecognizer(tapRecognizer)
        }
        
        func viewTapped() {
            dismiss(animated: true, completion: nil)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
