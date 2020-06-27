//
//  AppDelegate.swift
//  日时记
//
//  Created by Martin Zhang on 2018/10/26.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications


    //coredata支持
    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate ,UISplitViewControllerDelegate {
        
        var window: UIWindow?
       var backgroundTask:UIBackgroundTaskIdentifier! = nil
        
        
        
        func applicationDidEnterBackground(_ application: UIApplication) {
               
            // 延迟程序静止的时间
            DispatchQueue.global().async() {
                //如果已存在后台任务，先将其设为完成
                if self.backgroundTask != nil {
                    application.endBackgroundTask(self.backgroundTask)
                    self.backgroundTask = UIBackgroundTaskIdentifier.invalid
                }
            }
               
            //如果要后台运行
            self.backgroundTask = application.beginBackgroundTask(expirationHandler: {
                   () -> Void in
                //如果没有调用endBackgroundTask，时间耗尽时应用程序将被终止
                application.endBackgroundTask(self.backgroundTask)
                self.backgroundTask = UIBackgroundTaskIdentifier.invalid
            })
        }

        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){(granted,error) in
                if granted {
                    print("授权成功")
                }else{
                    print("授权失败")
                }
                
            }
            
            return true
            
        }
        
        lazy var persistentContainer : NSPersistentContainer = {
            let container = NSPersistentContainer(name: "rishiji")
            container.loadPersistentStores(completionHandler: {(storeDescription,error) in
                if let error = error as NSError?{
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            
            })
            return container
        }()
        
        func savecontext (){
            let context = persistentContainer.viewContext
            if context.hasChanges{
                do{
                    try context.save()
                    
                }catch{
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    
                }
            }
        }
        
        
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


func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    guard let topAsDetailController = secondaryAsNavController.topViewController as? ViewController_riji_details else { return false }
    if topAsDetailController.detailItem == nil {
        // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return true
    }
    return false

}
 

