//
//  ViewController.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 11.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var gifView: UIImageView!  //outlet for login background Animation
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "LoginBackround") // animation in the background
        
        
        
        
        
    }
    
    
//    func firebaseAuth(_ credential: AuthCredential) {
//
//        Auth.auth().signIn(with: credential, completion: { (user, error) in
//            if error != nil {
//
//                print("Jakub: Unable to auth with Firebase -\(String(describing: error))")
//            } else {
//
//                print("Jakub: Successfully authenticated with Firebase")
//                if let user = user {
//
//                    let userData = ["provider": credential.provider]
//                    //self.completeSignIN(id: user.uid, userData: userData) // it saves id to keychain
//                }
//            }
//        })
//    }

    

    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, email != "", let password = passwordTextField.text, password != "" {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Jakub: Email User authenticated with Firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Jakub: Unable to authenticate with Firebase using email")
                        } else {
                            print("Jakub: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
    
}

