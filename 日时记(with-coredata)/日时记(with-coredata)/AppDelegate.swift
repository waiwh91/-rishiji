//
//  AppDelegate.swift
//  日时记
//
//  Created by Martin Zhang on 2018/10/26.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData


    //coredata支持
    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        
        var window: UIWindow?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { return true }
        
        
        // MARK: - CoreData
        lazy var managedObjectModel: NSManagedObjectModel = {
            let modelURL = Bundle.main.url(forResource: "Texts", withExtension: "momd")
            let managedObjectModel = NSManagedObjectModel.init(contentsOf: modelURL!)
            return managedObjectModel!
        }()
        
        lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
            let persistentStoreCoordinator = NSPersistentStoreCoordinator.init(managedObjectModel: managedObjectModel)
            let sqliteURL = documentDir.appendingPathComponent("Texts.sqlite")
            let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
            var failureReason = "There was an error creating or loading the application's saved data."
            5
            do {
                try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqliteURL, options: options)
            } catch {
                // Report any error we got.
                var dict = [String: Any]()
                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as Any?
                dict[NSLocalizedFailureReasonErrorKey] = failureReason as Any?
                dict[NSUnderlyingErrorKey] = error as NSError
                let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 6666, userInfo: dict)
                print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
                abort()
            }
            return persistentStoreCoordinator
        }()
        
        lazy var documentDir: URL = {
            let documentDir = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
            return documentDir!
        }()
        
        lazy var context: NSManagedObjectContext = {
            let context = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
            context.persistentStoreCoordinator = persistentStoreCoordinator
            return context
        }()
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }




