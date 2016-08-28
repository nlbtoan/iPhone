//
//  ViewController.swift
//  PhoneBook
//
//  Created by nlbtoan on 7/31/16.
//  Copyright © 2016 nlbtoan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var datasource : Results<ContactItem>!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadTheTable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        reloadTheTable()
    }
    
    func reloadTheTable() {
        datasource = ContactDataController.fetchAllContact()
        tableView?.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI()
    {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //datasource delegation
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datasource.count
    }
    
    
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifer: String = "myCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifer)
        if ((cell == nil)) {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifer)
            
        }
        let currentContactInfo = datasource[indexPath.row]
        cell?.textLabel?.text = currentContactInfo.Name
        cell?.detailTextLabel?.text = currentContactInfo.PhoneNumber
        
        return cell!
    }
    
    //delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("Selected row at \(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100;
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let myHeader = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myHeader.backgroundColor = UIColor.yellowColor()
        return myHeader
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 80
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let myHeader = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myHeader.backgroundColor = UIColor.purpleColor()
        return myHeader
    }
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 80
    }
    
    
    
    
    @IBAction func actionGotoEntryVC(sender: AnyObject) {
        performSegueWithIdentifier("goToEntryVC", sender: nil)
    }
    
    
    

}

