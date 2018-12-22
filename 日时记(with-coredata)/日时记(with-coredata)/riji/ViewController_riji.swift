//
//  ViewController_riji.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/30.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController_riji: UIViewController{
    
    var listData = NSMutableArray()
    
 

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获得DAO对象
        let dao = NoteDAO.sharedInstance
        //查询所有数据
        self.listData = dao.findAll()
        
        
        // Do any additional setup after loading the view.
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


