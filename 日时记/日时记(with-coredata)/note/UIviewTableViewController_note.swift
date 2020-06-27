//
//  UIviewTableViewController_note.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/25.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData


class UIviewTableViewController_note: UITableViewController {
    
    var ViewController_note_details: ViewController_note_details? = nil
    var listData = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.backgroundView = UIImageView(image:UIImage(named: "便签bg.png"))

        let dao = NotesDAO.sharedInstance
        self.listData = dao.findAll()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        let dao = NotesDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        self.tableView.reloadData()
        super.viewWillAppear(animated)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_notes"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let note = self.listData[indexPath.row] as! note
                let controller = (segue.destination as! UINavigationController).topViewController as! ViewController_note_details
                controller.notetext = note
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note_cells", for: indexPath)
       // cell.backgroundColor = UIColor.clear
        let row = (indexPath as IndexPath).row
        let note = listData[row] as! note
        
       // print(note.date)
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let date = dateformatter.string(from: note.date as Date)
        
        //print(date)
        var text : String = "wdnmd"
        
        if note.types == 1 {
            text = "空便签"
        }
        if note.types == 2 {
            text = "待办事项"
        }
        if note.types == 3 {
            text = "提醒事项"
        }
        
        cell.detailTextLabel?.text = date
        cell.textLabel!.text = text
        
        //print(date)
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = self.listData[indexPath.row] as! note
            
            //获得DAO对象
            let dao = NotesDAO.sharedInstance
            //删除数据
            dao.remove(note)
            //查询所有数据
            self.listData = dao.findAll()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
