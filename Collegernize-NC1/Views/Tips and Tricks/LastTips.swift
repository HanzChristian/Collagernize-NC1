//
//  LastTips.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 07/05/22.
//

import Foundation
import UIKit

class LastTips:UIViewController{
    
    
    @IBAction func finishPressed(_ sender: UIButton){
        
        guard let vc = storyboard?.instantiateViewController(identifier: "HomePageController") as? HomePageController else{
            return
        }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true,completion: nil)
        
    }
    
}
