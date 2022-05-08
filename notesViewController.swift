//
//  notesViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 28/04/22.
//

import Foundation
import UIKit

class notesViewController:UIViewController, UITextViewDelegate{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    
    var date:String?

    
    public var completion: ((String,String) -> Void)?
    
    override func viewDidLoad() {
        noteTextView.text = "Type here to write..."
        dateLabel.text = date
        noteTextView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapDone))
    }
    
    @objc func didTapDone(){
        if let text = noteTextView.text, !text.isEmpty, !noteTextView.text.isEmpty{
            if text.isEmpty || text == "" || text == "Type here to write..." {
                displayAlert(title: "Warning!", body: "Please input something first before it saved!", isDisplayDetail: false)
            } else {
                displayAlert(title: "Yeayyy!", body: "Diary has been saved!", isDisplayDetail: true)
                completion?(dateLabel.text!,noteTextView.text) //passing data
            }
        }
        
    }
    
    func displayAlert(title: String, body: String, isDisplayDetail: Bool) {
        
        let alert = UIAlertController.init(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default) { action in
            alert.dismiss(animated: true) {
//                if isDisplayDetail {
//                    self.performSegue(withIdentifier: "personalNotesSegue", sender: .none)
//                }
            }
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        noteTextView.text = ""
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "doneSegue"{
//                let destinationVC = segue.destination as? previewViewController
//            destinationVC?.dates = date!
//            }
//    }
    
}
