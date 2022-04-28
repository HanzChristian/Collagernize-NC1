//
//  notesViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 28/04/22.
//

import Foundation
import UIKit

class notesViewController:UIViewController{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    
    var date:String?
    
    public var completion: ((String,String) -> Void)?
    override func viewDidLoad() {
        dateLabel.text = date
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapDone))
    }
    
    @objc func didTapDone(){
        if let text = dateLabel.text, !text.isEmpty, !noteTextView.text.isEmpty{
            completion?(text,noteTextView.text)
        }
    }
    
}
