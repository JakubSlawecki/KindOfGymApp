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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
