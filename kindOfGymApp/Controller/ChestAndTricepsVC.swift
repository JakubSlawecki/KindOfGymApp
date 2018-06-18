//
//  ChestAndTricepsVC.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 12.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import Firebase

class ChestAndTricepsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var exercises = [Exercise]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "chestVCBackground")
        tableView.delegate = self
        tableView.dataSource = self
        
        // this will observe if there are changes in the database
        DataService.ds.REF_CHEST_EXERCISES.observe(.value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                for snap in snapshot {
                    print("snap: \(snap)")
                    if let exerciseDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let exercise = Exercise(exerciseKey: key, exerciseData: exerciseDict)
                        self.exercises.insert(exercise, at: 0)
                    }
                }
                self.tableView.reloadData()
            }
        }
        
    
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exercise = exercises[indexPath.row]
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChestExerciseCell") as? ChestExerciseCell {
            cell.configureCell(exercise: exercise)
            return cell
        } else {
            return ChestExerciseCell()
        }
        
    }
    
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
