//
//  LauncScreenModifier.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 27/04/22.
//

import Foundation
import UIKit

class LaunchScreen : UIViewController{
    
    override func viewDidLoad() {
        
    }
    
    func applicationDidBecomeActivie(application : UIApplication){
        
        let storyboard = UIStoryboard(name:"LaunchScreen.storyboard",bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LaunchScreen.storyboard")
        self.window!rootViewController!.presentedViewController(v)
    }
}
