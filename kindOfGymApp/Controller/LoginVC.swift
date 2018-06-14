//
//  ViewController.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 11.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper



class LoginVC: UIViewController {
    @IBOutlet weak var gifView: UIImageView!  //outlet for login background Animation
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "LoginBackround") // animation in the background
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "ShowSplashScreenVC", sender: nil)       // if there is an uid in keychain then it will do Segue to -ShowSplashScreen
        }
    }

    

    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, email != "", let password = passwordTextField.text, password != "" {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Jakub: Email User authenticated with Firebase")
                    if let user = user {
                        
                        let userData = ["email": user.email]
                        self.completeSignIN(id: user.uid, userData: userData as! Dictionary<String, String>) // save that id to keychain
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Jakub: Unable to authenticate with Firebase using email")
                        } else {
                            print("Jakub: Successfully authenticated with Firebase")
                            if let user = user {
                                
                                let userData = ["email": user.email]
                                self.completeSignIN(id: user.uid, userData: userData as! Dictionary<String, String>) // save that id to keychain
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIN(id: String, userData: Dictionary<String, String>) {
    
    DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
    let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
    print("Jakub: Data saved to keychain \(keychainResult)")
    performSegue(withIdentifier: "ShowSplashScreenVC", sender: nil)
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { } 
    
}



























