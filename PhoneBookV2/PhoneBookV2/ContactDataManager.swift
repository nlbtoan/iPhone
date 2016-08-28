//
//  ContactDataManager.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class ContactDataManager: NSObject {
    
    class func addOrUpdate(contact : Contact)
    {
        let realm = RealmManager.realm()
        do
        {
            let result = realm.objects(Contact).filter("primeryKey = '\(contact.primeryKey)'")
            if (result.isEmpty)
            {
                try realm.write({ () -> Void in
                    realm.add(contact)
                    print("realm obect inserted")
                })
            }
            else
            {
                var oldConctact = result.first
                try realm.write({ () -> Void in
                    oldConctact = contact
                    print("item with primeryKey of \(contact.primeryKey) updated.")
                })
            }
        }
        catch
        {
            print("error while update")
        }
    }
    
    class func fetchObject(whereClause : String) -> Results<Contact>
    {
        let realm = RealmManager.realm()
        return realm.objects(Contact).filter(whereClause)
    }
    
    class func fetchObject() -> Results<Contact>
    {
        let realm = RealmManager.realm()
        return realm.objects(Contact)
    }
    
    class func fetchObjects() -> NSData
    {
        let realm = RealmManager.realm()
        let result = realm.objects(Contact)
        let loadArray : NSMutableArray = NSMutableArray()
        for contact in result
        {
            loadArray.addObject(contact.toDictionary())
        }
        return loadArray.toStringOfJSON()!.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    class func fetchObects(whereClause : String) -> NSData
    {
        let realm = RealmManager.realm()
        let result = realm.objects(Contact).filter(whereClause)
        let loadArray : NSMutableArray = NSMutableArray()
        for contact in result
        {
            loadArray.addObject(contact.toDictionary())
        }
        return loadArray.toStringOfJSON()!.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    class func deleteObject(contact : Contact)
    {
        let realm = RealmManager.realm()
        do
        {
            try realm.write({ () -> Void in
                print("Contact with UUID of \(contact.primeryKey) deleted.")
                realm.delete(contact)
            })
        }
        catch
        {
            
        }
    }

}
