//
//  historyViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 28/04/22.
//

import Foundation
import UIKit

class historyViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var date:String?
    
    var models: [(dates: String, notes: String)] = [] //isi array
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "All Notes"
    }
    
    @IBAction func didTapNewNote(){
        performSegue(withIdentifier: "notesSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue"{
            let destinationVC = segue.destination as? notesViewController
            destinationVC?.date = date
                
            destinationVC?.completion = {date,note in
            self.models.append((dates: date,notes: note))
            self.table.isHidden = false
            self.table.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = models[indexPath.row].dates
        cell.detailTextLabel?.text = models[indexPath.row].notes
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? previewViewController else{
            return
        }
        vc.note = model.notes
        vc.dates = model.dates
        vc.modalPresentationStyle = .popover
        present(vc,animated: true,completion: nil)
    }
    
}
