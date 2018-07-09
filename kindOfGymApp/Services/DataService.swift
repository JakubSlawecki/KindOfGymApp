//
//  DataService.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 14.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    
    //references for Exercises days
    private var _REF_CHEST_EXERCISES = DB_BASE.child("chestExercises")
    private var _REF_BACK_BICEPS_EXERCISES = DB_BASE.child("backAndBicepsExercises")
    private var _REF_LEGS_EXERCISES = DB_BASE.child("legsExercises")
    private var _REF_SHOULDERS_EXERCISES = DB_BASE.child("shouldersExercises")
    
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_EXERCISE_IMAGES = STORAGE_BASE.child("exercice-pics")
    
    
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_CHEST_EXERCISES: DatabaseReference {
        return _REF_CHEST_EXERCISES
    }
    
    var REF_BACK_BICEPS_EXERCISES: DatabaseReference {
        return _REF_BACK_BICEPS_EXERCISES
    }
    
    var REF_LEGS_EXERCISES: DatabaseReference {
        return _REF_LEGS_EXERCISES
    }
    
    var REF_SHOULDERS_EXERCISES: DatabaseReference {
        return _REF_SHOULDERS_EXERCISES
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_EXERCISE_IMAGES: StorageReference {
        return _REF_EXERCISE_IMAGES
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) { // uid will be  user and userData will be the "provider"
        REF_USERS.child(uid).updateChildValues(userData)  // if the user is not in the database, firebase will create it automatically!
    }
    
    
    
    
}
