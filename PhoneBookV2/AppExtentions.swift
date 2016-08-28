//
//  AppExtentions.swift
//  PhoneBookV2
//
//  Created by nlbtoan on 8/28/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit

extension NSData
{
    func toJSONArray() -> NSArray?
    {
        do
        {
            return try NSJSONSerialization.JSONObjectWithData(self, options: .AllowFragments) as? NSArray
        }
        catch
        {
            return nil
        }
    }
}


extension NSMutableArray
{
    func toStringOfJSON() -> String?
    {
        do
        {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted)
            let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
            return jsonString
        }
        catch
        {
            return "[]"
        }
    }
}