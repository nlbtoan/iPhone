//
//  EntryViewController.swift
//  PhoneBook
//
//  Created by nlbtoan on 8/27/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift


class EntryViewController: UIViewController {

    @IBOutlet weak var txtContactName: UITextField!
    
    @IBOutlet weak var txtContactTelephoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSaveData(sender: AnyObject) {
        saveContacts()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    func saveContacts()
    {
        let newContact = ContactItem()
        newContact.Name = txtContactName.text!
        newContact.PhoneNumber = txtContactTelephoneNumber.text!
        
        //let realm = try! Realm()
        //try! realm.write() {
        //    realm.add(newContact)
        //}
        
        ContactDataController.saveContact(newContact)
    }
    

    
}
