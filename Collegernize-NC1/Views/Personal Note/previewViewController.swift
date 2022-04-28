//
//  previewViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 28/04/22.
//

import Foundation
import UIKit

class previewViewController:UIViewController{
    
    @IBOutlet var noteTextView: UITextView!
    public var note:String = ""
    
    
    override func viewDidLoad() {
        noteTextView.text = note
    }
}
