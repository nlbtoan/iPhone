//
//  ContactDataController.swift
//  PhoneBook
//
//  Created by nlbtoan on 8/27/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class ContactDataController: NSObject {

    class func saveContact(Contact : ContactItem)
    {
        do
        {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(Contact)
                print("Contct Saved")
            })
        }
        catch
        {
            
        }
    }
    
    class func fetchAllContact() -> Results<ContactItem>!
    {
        do
        {
            let realm = try Realm()
            return realm.objects(ContactItem)
        }
        catch
        {
            print("error while query database")
            return nil
        }
    }
}
