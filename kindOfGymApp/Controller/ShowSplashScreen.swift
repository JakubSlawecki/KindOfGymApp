//
//  ShowSplashScreen.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 11.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {
    @IBOutlet weak var hiGifView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hiGifView.loadGif(name: "HiScreenBackground")
        
        perform(#selector(performSegueAfterDeley), with: nil, afterDelay: 3)
        
    }
    
    
    
    
    @objc func performSegueAfterDeley() {
        performSegue(withIdentifier: "ShowChooseVC", sender: self)
    }

    
    

    

}
