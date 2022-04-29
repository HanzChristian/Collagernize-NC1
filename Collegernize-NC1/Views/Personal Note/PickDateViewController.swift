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
    
    var models: [(dates: String, notes: String)] = [] //isi array
    
    override func viewDidLoad() {
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
    
    @IBAction func continueBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "historySegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historySegue"{
                let destinationVC = segue.destination as? historyViewController
                destinationVC?.date = dateTxt.text
            }
    }
    
}
