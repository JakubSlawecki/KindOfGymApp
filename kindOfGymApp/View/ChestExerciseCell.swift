//
//  ChestExerciseCell.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 13.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class ChestExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseImg: UIImageView!
    @IBOutlet weak var exerciseNameLebel: UILabel!
    @IBOutlet weak var setsAndRepetitionsText: UILabel!
    @IBOutlet weak var restTimeBetweenSetsText: UILabel!
    @IBOutlet weak var exerciseDescriptionText: UITextView!
    
    var exercise: Exercise!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(exercise: Exercise) {
        self.exercise = exercise
        
        self.exerciseNameLebel.text = exercise.nameOfExercise
        self.setsAndRepetitionsText.text = exercise.noOfSetsAndReps
        self.restTimeBetweenSetsText.text = exercise.restTime
        self.exerciseDescriptionText.text = exercise.exerciseDescription
    }

    

}
