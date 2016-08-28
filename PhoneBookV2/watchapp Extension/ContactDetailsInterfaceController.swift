//
//  ContactDetailsInterfaceController.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import WatchKit
import Foundation


class ContactDetailsInterfaceController: WKInterfaceController {
    var contact : Contact!

    @IBOutlet var lblFullName: WKInterfaceLabel!
    @IBOutlet var lblEmail: WKInterfaceLabel!
    @IBOutlet var lblMobileNo: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        contact = context as! Contact
        lblEmail.setText(contact.email)
        lblFullName.setText(contact.fullname)
        lblMobileNo.setText(contact.mobileno)
        print(contact.fullname)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
