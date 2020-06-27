//
//  NoteDAO_Father.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/26.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import Foundation
import CoreData


open class NoteDAO_Father: NSObject {
    
    //返回持久化存储容器
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Notes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("持久化存储容器错误：", error.localizedDescription)
            }
        })
        return container
    }()
    
    /// MARK: - 保存数据
    //保存数据
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("数据保存错误：", nserror.localizedDescription)
                
            }
        }
    }
}


