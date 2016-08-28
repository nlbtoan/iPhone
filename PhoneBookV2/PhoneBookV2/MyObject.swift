//
//  MyObject.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class MyObject: Object {
    
    func toDictionary() -> NSDictionary
    {
        let schema = self.objectSchema
        let properties = schema.properties.map() { $0.name }
        let dictionary = self.dictionaryWithValuesForKeys(properties)
        return dictionary
    }

}
