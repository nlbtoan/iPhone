//
//  ViewController.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblContacts : UITableView!
    var contacts : Results<Contact>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myfirstContact = Contact()
        myfirstContact.primeryKey = NSUUID().UUIDString
        myfirstContact.fullname = "Toan Nguyen"
        myfirstContact.homeno = "4444-2222"
        myfirstContact.email = "nlb.toan@gmail.com"
        
        ContactDataManager.addOrUpdate(myfirstContact)
        
        setupTable()
    }
    
    func setupTable()
    {
        tblContacts.dataSource = self
        tblContacts.delegate = self
        reload(true)
    }
    
    func reload(shouldReloadTable : Bool)
    {
        contacts = ContactDataManager.fetchObject()
        if (shouldReloadTable)
        {
            tblContacts.reloadData()
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifer: String = "myCell"
        var cell = tblContacts.dequeueReusableCellWithIdentifier(identifer)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifer)
        }
        let currentContactInfo = contacts[indexPath.row]
        cell?.textLabel?.text = currentContactInfo.fullname
        
        return cell!
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete)
        {
            let contact : Contact = contacts[indexPath.row]
            ContactDataManager.deleteObject(contact)
            tblContacts.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
            reload(false)
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact : Contact = contacts[indexPath.row]
        performSegueWithIdentifier("goToContactDetail", sender: contact)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "goToContactDetail")
        {
            let contactDetailViewController : ContactDetailViewController = (segue.destinationViewController as? ContactDetailViewController)!
            contactDetailViewController.contact = sender as! Contact
        }
    }
}

