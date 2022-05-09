//
//  PickDateViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 27/04/22.
//

import UIKit

class PickDateViewController:UIViewController{
    
    
//    @IBOutlet weak var dateTxt: UITextField!
//    var dateSelected: String?
    
    @IBOutlet weak var dateTxt: UITextField!
    let datePicker = UIDatePicker()
    
    var noteModels = notesFeeder()
    
    override func viewDidLoad() {
//        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        createDatePicker()
    }
    
    func createDatePicker(){
        
        //Untuk center date
        dateTxt.textAlignment = .center
        
        //Untuk mendapatkan toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Membuat button pada toolbar
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done , target: nil, action: #selector(donePressed)) //ketika dipencet, memberikan action berdasarkan function donepressed
        toolbar.setItems([doneBtn], animated: true)
        
        //Get toolbar and date picker
        dateTxt.inputAccessoryView = toolbar
        dateTxt.inputView = datePicker
        
        //Menampilkan date saja
        datePicker.datePickerMode = .date
        
        //buat nampilin style calendar
        datePicker.preferredDatePickerStyle = .inline
        
    }
    
    @objc func donePressed(){
        
        //Format isi date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTxt.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
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
    
    
    @IBAction func continueBtn(_ sender: UIButton) {
        if let text = dateTxt.text{
            if text.isEmpty || text == ""{
                displayAlert(title: "Warning!", body: "Please input something first before it saved!", isDisplayDetail: false)
            } else {
                performSegue(withIdentifier: "historySegue", sender: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historySegue"{
                let destinationVC = segue.destination as? historyViewController
                destinationVC?.date = dateTxt.text
                destinationVC?.noteModels = noteModels
            }
    }
    
    
//    @IBAction func backPressed(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "HomePageController") as? HomePageController else{
//            return
//        }
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc,animated: true,completion: nil)
//    }
    

    
}
