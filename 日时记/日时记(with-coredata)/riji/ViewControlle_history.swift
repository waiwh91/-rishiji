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
    
    var listData = NSMutableArray()
    var mooddate = [Date]()
    var number:Int = 0
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Calender.scrollDirection = .vertical
        //获得DAO对象
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        self.number = listData.count
        
        for index in 0...number-1 {
            let note = listData[index] as! riji
            //print(note.date)
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            
            
            self.mooddate.append(note.date as Date)
            
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
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
