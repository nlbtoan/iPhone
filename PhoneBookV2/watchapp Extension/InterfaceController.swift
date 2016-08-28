//
//  InterfaceController.swift
//  watchapp Extension
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import RealmSwift


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    let session = WCSession.defaultSession()

    @IBOutlet var tblContact : WKInterfaceTable!
    
    var contact : Results<Contact>!
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        requestFromiOS(RequestContacts)
        initTable()
    }
    
    func initTable()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.contact = ContactDataManager.fetchObject()
            self.tblContact.setNumberOfRows(self.contact.count, withRowType: "ContactType")
            for var contactCounter in 0 ..< self.contact.count
            {
                let currentRow = self.tblContact.rowControllerAtIndex(contactCounter) as! ContactCell
                let currentContact = self.contact[contactCounter]
                currentRow.lblName.setText(currentContact.fullname)
                
            }
        })
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let currentContact = contact[rowIndex]
        presentControllerWithName("ContactDetailsWC", context: currentContact)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        session.delegate = self
        session.activateSession()
    }
    
    
    func requestFromiOS(requestCode : Int)
    {
        session.sendMessage(["RequestType":requestCode], replyHandler: {(data) -> Void in
            }, errorHandler: {(erro) -> Void in})
    }
    
    func session(session: WCSession, didReceiveMessageData messageData: NSData) {
        let decodedJson = messageData.toJSONArray()

        for item in decodedJson!
        {
            let currentDictionary = item as! NSDictionary
            let currentContact = Contact()
            currentContact.primeryKey = currentDictionary["primeryKey"] as! String
            currentContact.fullname = currentDictionary["fullname"] as! String
            currentContact.homeno = currentDictionary["homeno"] as! String
            currentContact.email = currentDictionary["email"] as! String
            ContactDataManager.addOrUpdate(currentContact)
            
        }
        initTable()
    }



    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
