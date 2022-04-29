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
    @IBOutlet var dateLabel: UILabel!
    
    public var dates:String = ""
    public var note:String = ""
    
    
    override func viewDidLoad() {
        dateLabel.text = dates
        noteTextView.text = note
    }
}
