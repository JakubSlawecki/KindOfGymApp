//
//  ChooseTrainingVC.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 12.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class ChooseTrainingVC: UIViewController {
    @IBOutlet weak var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "chooseyouttrainingbackground")
        
    }

    
    

    @IBAction func signOutBtnPressed(_ sender: UIButton) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Jakub: ID removed from keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
}
