//
//  DocumentEditViewController.swift
//  Documents Core Data
//
//  Created by Brock Gibson on 2/19/19.
//  Copyright © 2019 Brock Gibson. All rights reserved.
//

import UIKit

class DocumentEditViewController: UIViewController {
    
    var existingDocument: Document?

    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func nameChanged(_ sender: UITextField) {
        titleBar.title = nameTextField.text
    }
    
    @IBAction func clickSave(_ sender: Any) {
        
        let name = nameTextField.text
        let content = contentTextField.text ?? ""
        let dateModified = Date()
        
        
        if let document = Document(name: name, content: content, date: dateModified, size: content) {
            do {
                let managedContext = document.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }
            catch {
                print("context could not be saved")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
