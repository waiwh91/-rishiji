//
//  ViewController_riji.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/30.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController_riji: UIViewController, UITableViewDataSource,UITableViewDelegate
{
    
    var viewController_rji_details: ViewController_riji_details? = nil
    
    var listData = NSMutableArray()
    @IBOutlet var tableview: UITableView!
    
    
    @IBOutlet var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获得DAO对象
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        print(listData)
        tableview.reloadData()
        
        /*if let split = self.splitViewController {
            let controllers = split.viewControllers
         self.viewController_rji_details = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ViewController_riji_details
         }*/
        
        // Do any additional setup after loading the view.
    }
    
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableview.indexPathForSelectedRow {
                let note = self.listData[indexPath.row] as! riji
                let controller = (segue.destination
                    as! UIViewController) as! ViewController_riji_details
                controller.detailItem = note
            }
        }
    }*/

    
   /* @IBAction func btn(_ sender: Any) {
        self.tableview.reloadData()
        //self.view1.reloadInputViews()
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let row = (indexPath as IndexPath).row
        let note = listData[row] as! riji
       // print(note)
        
       
        
        cell.textLabel!.text = note.text
        cell.detailTextLabel!.text = note.date.description
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = self.listData[indexPath.row] as! riji
            
            //获得DAO对象
            let dao = NoteDAO.sharedInstance
            //删除数据
            dao.remove(note)
            //查询所有数据
            self.listData = dao.findAll()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
   

    func reloadView(_ notification : Notification) {
        let resList = notification.object as! NSMutableArray
        self.listData = resList
        self.tableview.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}


