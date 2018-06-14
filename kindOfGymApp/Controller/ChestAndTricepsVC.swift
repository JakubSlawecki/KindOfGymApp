//
//  ChestAndTricepsVC.swift
//  kindOfGymApp
//
//  Created by Jakub Slawecki on 12.06.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class ChestAndTricepsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "chestVCBackground")
        tableView.delegate = self
        tableView.dataSource = self
        
        // this will observe if there are changes in the database
        DataService.ds.REF_CHEST_EXERCISES.observe(.value, with: { (snapshot) in
            print(snapshot.value!)
        })
        
    
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ChestExerciseCell") as! ChestExerciseCell
    }
    
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
