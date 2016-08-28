//
//  InterfaceController.swift
//  PhoneBookWatch Extension
//
//  Created by nlbtoan on 8/27/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tblContact: WKInterfaceTable!
    let name = ["Toan", "Dung", "Song"]
    let phone = ["555111", "555222", "555333"]
    
    func configureTable()
    {
        self.tblContact.setNumberOfRows(name.count, withRowType: "ContactCellIden")
        for counter in 0 ..< name.count
        {
            let currentRow : ContactCell = self.tblContact.rowControllerAtIndex(counter) as! ContactCell
            currentRow.lblName.setText(name[counter])
            currentRow.lblPhoneNumber.setText(phone[counter])
            
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        configureTable()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
