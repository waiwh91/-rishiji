//
//  ViewControlle_history.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2019/1/30.
//  Copyright © 2019 Martin Zhang. All rights reserved.
//

import UIKit
import FSCalendar
import CoreData

class ViewControlle_history: UIViewController,FSCalendarDelegate,FSCalendarDataSource{

    @IBOutlet weak var Calender: FSCalendar!
    
    
    var ViewController_riji_details : ViewController_riji_details? = nil

    
    var listData = NSMutableArray()
    var fetchDate = riji()
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Calender.scrollDirection = .vertical
        //获得DAO对象
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        
        
      //print(listData)
        
        // Do any additional setup after loading the view.
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let calendar = NSCalendar.current
        let dateComponents = calendar.dateComponents(in: TimeZone.current, from:date)
        let newdate = NSDateComponents()
        newdate.year = dateComponents.year!
        newdate.month = dateComponents.month!
        newdate.day = dateComponents.day!
        
        let newnewdate = calendar.date(from: newdate as DateComponents)
        let fetchnewdate:Date = newnewdate!
        
        fetchDate.date = fetchnewdate
        let dao = NoteDAO.sharedInstance
        dao.IDfind(fetchDate)
        print(dao.IDfind(fetchDate))
        
        if dao.IDfind(fetchDate) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destination = storyboard.instantiateViewController(withIdentifier: "rijidetails") //as? SecondViewController
            let controller = destination as! ViewController_riji_details
            
            let result :riji = dao.IDfind(fetchDate)!
            
            //print(result.text)
            
            controller.detailItem = result
            
            //controller.detailItem = dao.IDfind(fetchDate)
            
            
            
            self.navigationController?.pushViewController(destination, animated: true)
            
        }else{
            let alertcontroller = UIAlertController(title: "嗯哼？", message: "你在那天似乎并没有写什么东西哦", preferredStyle: .alert)
            let cancelaction = UIAlertAction(title: "好吧", style: .cancel, handler: nil)
            alertcontroller.addAction(cancelaction)
            self.present(alertcontroller, animated: true, completion: nil)
        }
       
        
        }
        
        
        //let controller = UIViewController as! ViewController_historydetail
       // controller.detailItem = dao.IDfind(fetchDate)
            
       
    

        
        
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}


