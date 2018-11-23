//
//  CoreDataDAO.swift
//  日时记
//
//  Created by Martin Zhang on 2018/11/9.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataDAO : NSObject {
    
    //返回持久化存储容器
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name:"CoreDataNotes")
        container.loadPersistentStores(completionHandler:{(storeDescription, error)in
            if let error = error as NSError?{
                print("持久化存储容器错误：",error.localizedDescription)
            }
        })
        return container
    }()
    
    
    //v保存数据
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do {
                try context.save()
                
            }catch {
                let nserror = error as NSError
                print("保存数据错误：",nserror.localizedDescription)
            }
        }
    }
}
