//
//  NoteDAO.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/25.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class NotesDAO : NoteDAO_Father{
        
        //私有的DateFormatter属性
        private var dateFormatter = DateFormatter()
        
        public static let sharedInstance: NotesDAO = {
            let instance = NotesDAO()
            
            //初始化DateFormatter
            instance.dateFormatter.dateFormat = "yyyy-MM-dd"
            
            return instance
        }()
        
        //插入Note方法
         public func create(_ model: note) -> Int {
            
            let context = persistentContainer.viewContext
            
            let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into:context) as! NoteManagedObject
            
            
            note.date = model.date as Date
            note.text = model.text
            note.types = model.types
            //保存数据
            self.saveContext()
            print(note)
            return 0
        }
    
    
    
    //删除Note方法
    public func remove(_ model: note) -> Int {
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date as CVarArg)
        
        do {
            let listData = try context.fetch(fetchRequest)
            if listData.count > 0 {
                let note = listData[0] as! NoteManagedObject
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
    public func modify(_ model: note) -> Int {
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date as CVarArg)
        
        do {
            let listData = try context.fetch(fetchRequest)
            if listData.count > 0 {
                let note = listData[0] as! NoteManagedObject
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
            
            let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
            
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
                        let mo = item as! NoteManagedObject
                        let notes = note(date: mo.date! , text: mo.text!, types: mo.types)
                        resListData.add(notes)
                    }
                }
            } catch {
                NSLog("查询数据失败")
            }
            
            return resListData
        }
    
    //有条件查找
    public func IDfind(_ model: note) -> note?{
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        fetchRequest.predicate = NSPredicate(format: "date = %@", model.date as CVarArg)
        
       // print(fetchRequest)
        
        do{
            let listData = try context.fetch(fetchRequest)
            if listData.count > 0{
                let mo = listData[0] as! NoteManagedObject
                let notes = note(date: mo.date! , text: mo.text!, types:mo.types)
                return notes
            }
            
            
        }catch{
            NSLog("查询失败")
        }
        return nil
    }

}
