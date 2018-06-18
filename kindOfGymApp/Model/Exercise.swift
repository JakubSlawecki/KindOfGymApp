//
//  Exercise.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 15.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import Foundation

class Exercise {
    private var _exerciseDescription: String!
    private var _imageUrl: String!
    private var _nameOfExercise: String!
    private var _noOfSetsAndReps: String!
    private var _restTime: String!
    private var _exerciseKey: String!
    
    
    var exerciseDescription: String {
        return _exerciseDescription
    }
    var imageUrl: String {
        return _imageUrl
    }
    var nameOfExercise: String {
        return _nameOfExercise
    }
    var noOfSetsAndReps: String {
        return _noOfSetsAndReps
    }
    var restTime: String {
        return _restTime
    }
    var exerciseKey: String {
        return _exerciseKey
    }
    
    init(exerciseDescription: String, imageUrl: String, nameOfExercise: String, noOfSetsAndReps: String, restTime: String) {
        self._exerciseDescription = exerciseDescription
        self._imageUrl = imageUrl
        self._nameOfExercise = nameOfExercise
        self._noOfSetsAndReps = noOfSetsAndReps
        self._restTime = restTime
    }
    
    init(exerciseKey: String, exerciseData: Dictionary<String, AnyObject>) {
        self._exerciseKey = exerciseKey
        
        if let exerciseDescription = exerciseData["exerciseDescription"] as? String {
            self._exerciseDescription = exerciseDescription
        }
        if let imageUrl = exerciseData["imageUrl"] as? String{
            self._imageUrl = imageUrl
        }
        if let nameOfExercise = exerciseData["nameOfExercise"] as? String {
            self._nameOfExercise = nameOfExercise
        }
        if let noOfSetsAndReps = exerciseData["noOfSetsAndReps"] as? String {
            self._noOfSetsAndReps = noOfSetsAndReps
        }
        if let restTime = exerciseData["restTime"] as? String {
            self._restTime = restTime
        }
        
    }
    
}



















