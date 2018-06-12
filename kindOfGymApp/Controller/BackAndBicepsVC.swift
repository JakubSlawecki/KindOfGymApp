//
//  BackAndBicepsVC.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 12.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class BackAndBicepsVC: UIViewController {
    @IBOutlet weak var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "backAndBicepsVCbackground")

        
    }

    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
