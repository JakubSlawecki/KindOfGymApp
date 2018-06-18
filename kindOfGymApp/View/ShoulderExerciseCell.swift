//
//  ShoulderExerciseCell.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 13.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import Firebase

class ShoulderExerciseCell: UITableViewCell {

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
    
    func configureCell(exercise: Exercise, img: UIImage?) {
        self.exercise = exercise
        
        self.exerciseNameLebel.text = exercise.nameOfExercise
        self.setsAndRepetitionsText.text = exercise.noOfSetsAndReps
        self.restTimeBetweenSetsText.text = exercise.restTime
        self.exerciseDescriptionText.text = exercise.exerciseDescription
        
        if img != nil {
            self.exerciseImg.image = img
        } else {
            let ref = Storage.storage().reference(forURL: exercise.imageUrl)
            ref.getData(maxSize: 4 * 5000 * 5000, completion: { (data, error) in
                if error != nil {
                    print("Jakub: Ubable to download image from Firebase Storage")
                } else {
                    print("Jakub: Image downloaded from Firebase Storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.exerciseImg.image = img
                            ShouldersVC.imageCache.setObject(img, forKey: exercise.imageUrl as NSString)
                        }
                    }
                }
            })
            
        }
    }

    
}
