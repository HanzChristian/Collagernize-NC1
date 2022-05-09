//
//  HomePageViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 07/05/22.
//

import Foundation
import UIKit

class HomePageController:UIViewController{
    
    override func viewDidLoad() {
    }
    
    var noteModels = notesFeeder()
    
    @IBAction func notesBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "notesSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue"{
           let destinationVC = segue.destination as? PickDateViewController
                destinationVC?.noteModels = noteModels
            }
        }
    
}
