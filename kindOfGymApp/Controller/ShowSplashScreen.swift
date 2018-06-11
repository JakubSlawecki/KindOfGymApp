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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hiGifView.loadGif(name: "HiScreenBackground")
        
        perform(Selector(("showChooseVC")), with: nil, afterDelay: 3)  // show chooseVC after 3 seconds
        
    }
    
    
    
    func showChooseVC() {
        performSegue(withIdentifier: "ShowChooseVC", sender: self)
    }

    
    

    

}
