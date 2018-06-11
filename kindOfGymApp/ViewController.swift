//
//  ViewController.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 11.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifView.loadGif(name: "LoginBackround") // animation in the background
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

