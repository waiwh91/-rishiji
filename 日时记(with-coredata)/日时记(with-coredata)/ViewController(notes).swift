//
//  ViewController(notes).swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/10.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController_notes_: UIViewController,UITextFieldDelegate,UITextViewDelegate{
    
    @IBOutlet weak var textview: UITextView!
    
    

    
    
    /*
    
    ///当前上下文
    public  lazy var mangerContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        ///需要设置一个调度器
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        return context
    }()
    
    ///调度器  设置保存的路径
    public lazy var   persistentStoreCoordinator:NSPersistentStoreCoordinator = {
        //需要保存的Datamodle
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel:self.mangerModel)
        let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let fileURL = URL(string: "db.sqlite", relativeTo: dirURL)
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: fileURL, options: nil)
        } catch {
            fatalError("Error configuring persistent store: \(error)")
        }
        return coordinator
    }()
    
    //调度器管理 model 也就是 创建的DataModel
    public lazy var mangerModel:NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: "Texts", withExtension: "momd") else{
            fatalError("加载错误")
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else{
            fatalError("加载错误")
        }
        return model
        }()
 
*/
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            print("textview获得焦点，点击return键")
            
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        
        /* let texts : String = textView.text
       
        print(texts) */
        
        
        
    }

   
    @IBAction func save(_ sender: Any) {
        print("点击保存")
       guard let textString = textview.text else { return }
        print(textString)
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyy-MM-dd' at 'HH:mm:ss.SSS"
        let strNowTime = timeFormatter.string(from: date) as String
        print(strNowTime)
        print(date)
        
        
        
        CoreDataManager.shared.saveTextWith(text: textString,date:date)
    }
        
    }
        

    
    
        
    
    
    
    

    
    
    
    
            
        /*let text :Texts = NSEntityDescription.insertNewObject(forEntityName: "Texts", into: self.mangerContext) as! Texts
        text.texts = texts*/
        
        
        
        

    
    
    
        //let one: texts  = NSEntityDescription.insertNewObject(forEntityName: "Texts", into: self.mangerContext) as! texts
        
    
    
    
    //下面的注释文字是让textview放弃第一响应者
    /*override func viewDidLoad() {
        super.viewDidLoad()
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if (text == "\n"){
                textView.resignFirstResponder()
                return false
            }
            return true
        }
 
        // Do any additional setup after loading the view.
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


