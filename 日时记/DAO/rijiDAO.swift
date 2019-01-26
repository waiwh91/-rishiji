//
//  rijiDAO.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 22/12/2018.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class NoteDAO : CoreDataDAO{
        
        //私有的DateFormatter属性
        private var dateFormatter = DateFormatter()
        
        public static let sharedInstance: NoteDAO = {
            let instance = NoteDAO()
            
            //初始化DateFormatter
            instance.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            return instance
        }()
        
        //插入Note方法
         public func create(_ model: riji) -> Int {
            
            let context = persistentContainer.viewContext
            
            let note = NSEntityDescription.insertNewObject(forEntityName: "Texts", into:context) as! Texts
            
           
            note.date = model.date as Date
            note.text = model.text
            note.mood = model.mood
            //保存数据
            self.saveContext()
            print(note)
            return 0
        }
    
    
    
    //删除Note方法
    public func remove(_ model: riji) -> Int {
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Texts", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)
        
        do {
            let listData = try context.fetch(fetchRequest)
            if listData.count > 0 {
                let note = listData[0] as! Texts
                context.delete(note)
                //保存数据
                self.saveContext()
            }
        } catch {
            NSLog("删除数据失败")
        }
        return 0
    }
    
    
    
    //修改Note方法
    public func modify(_ model: riji) -> Int {
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Texts", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)
        
        do {
            let listData = try context.fetch(fetchRequest)
            if listData.count > 0 {
                let note = listData[0] as! Texts
                //note.setValue(model.content, forKey: "content")
                note.text = model.text
                
                //保存数据
                self.saveContext()
            }
        } catch {
            NSLog("修改数据失败")
        }
        return 0
    }
 
        //查询所有数据方法
        public func findAll() -> NSMutableArray {
            
            let context = persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Texts", in: context)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
            fetchRequest.entity = entity
            
            /*let sortDescriptor = NSSortDescriptor(key:"date", ascending:true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            */
            let resListData = NSMutableArray()
            
            do {
                let listData = try context.fetch(fetchRequest)
                
                if listData.count > 0 {
                    
                    for item in listData {
                        let mo = item as! Texts
                        let note = riji(date: mo.date! as NSDate, text: mo.text!, mood: mo.mood!)
                        resListData.add(note)
                    }
                }
            } catch {
                NSLog("查询数据失败")
            }
            
            return resListData
        }

}
