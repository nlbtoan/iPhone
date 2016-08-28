//
//  ContactDetailViewController.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contact : Contact!

    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtHomeNo: UITextField!
    @IBOutlet weak var txtFullname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = contact.fullname
        txtFullname.text = contact.fullname
        txtEmail.text = contact.email
        txtHomeNo.text = contact.homeno
        txtMobileNo.text = contact.primeryKey
    }



}
