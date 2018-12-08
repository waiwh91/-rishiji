//
//  ViewController_riji.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/30.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController_riji: UIViewController {
    
    var dataArray: [Texts] = [Texts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lbl: UILabel!
    
    
    
    @IBAction func getTexts(_ sender: Any) {
        dataArray = CoreDataManager.shared.getAllText()
       print(dataArray)
        
    
    
    
 /*
    //创建一个读取coredata的函数
    func getNoteswith() -> [Texts] {
        let fetchRequest: NSFetchRequest = Texts.fetchRequest()
        do{
        let result = try mangerContext.fetch(text)
            print (result)
            return result
            
        }catch{
            fatalError()
        }
        
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

}
