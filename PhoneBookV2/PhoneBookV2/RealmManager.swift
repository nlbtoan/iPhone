//
//  RealmManager.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {

    /**
     Init realm db
     */
    class func setupRealm(AppGroupName : String) -> Realm?
    {
        do
        {
            return try Realm()
        }
        catch
        {
            print("init realm error")
            return nil
        }
    }
    
    /**
     Realm helper
     */
    class func realm() -> Realm
    {
        return RealmManager.setupRealm("")!
    }
    
}
