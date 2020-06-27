//
//  TableViewController_riji.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 20/01/2019.
//  Copyright © 2019 Martin Zhang. All rights reserved.
//

import UIKit

class TableViewController_riji: UITableViewController {

    
    var viewController_rji_details: ViewController_riji_details? = nil
    
    var listData = NSMutableArray()
    

    
    override func viewDidLoad(){

        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.backgroundView = UIImageView(image:#imageLiteral(resourceName: "日记bg") )
        //获得DAO对象
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        //print(listData)
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        self.tableView.reloadData()
        super.viewWillAppear(animated)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "showDetail" {
               if let indexPath = self.tableView.indexPathForSelectedRow {
                   let note = self.listData[indexPath.row] as! riji
                   let controller = (segue.destination as! UINavigationController).topViewController as! ViewController_riji_details
                   controller.detailItem = note
                   controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                   controller.navigationItem.leftItemsSupplementBackButton = true
               }
           }
       }
       
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.clear
        let row = (indexPath as IndexPath).row
        let note = listData[row] as! riji
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let date = dateformatter.string(from: note.date as Date)
        
        var text : String
        
        if note.mood == "" || note.mood == "选择一个心情～"{
            text = "鬼知道他在想什么"
        }else{
            text = note.mood
        }
        
        cell.textLabel!.text = date
        cell.detailTextLabel!.text = text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    // MARK: --处理通知
    func reloadView(_ notification : Notification) {
        let resList = notification.object as! NSMutableArray
        self.listData = resList
        self.tableView.reloadData()
    }
}
