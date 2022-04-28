//
//  tabbarController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 28/04/22.
//

import Foundation
import UIKit

class tabbarController:UIViewController{
    
    var date:String?
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "notesSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue"{
                let destinationVC = segue.destination as? notesViewController
                destinationVC?.date = date!
            }
    }
    
}
