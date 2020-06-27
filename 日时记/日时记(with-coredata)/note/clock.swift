//
//  clock.swift
//  日时记
//
//  Created by 张晨阳 on 2020/6/27.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import Foundation
import UserNotifications

public  func startimer(seconds : Int32,text:String,date:String){
    var timeCount : Int32 = seconds
    let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
    timer.schedule(deadline: .now(), repeating: .seconds(1))
    // 设定时间源的触发事件
    timer.setEventHandler(handler: {
        // 每秒计时一次
        timeCount = timeCount - 1
        // 时间到了取消时间源
        if timeCount <= 0 {
            print(23333333333)
            let content = UNMutableNotificationContent()
            content.body = text
            content.sound = UNNotificationSound.default
            content.subtitle = date
            content.title = text
            let timetrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: "rishiji.local.notification", content: content, trigger: timetrigger)
            
            UNUserNotificationCenter.current().add(request){(error) in
                if let error = error{
                    print("添加通知：\(error)")
                }else{
                    print("添加通知请求到通知中心")
                }
                
            }
            
            
            timer.cancel()
        }
        // 返回主线程处理一些事件，更新UI等等
        DispatchQueue.main.async {
            print("-------%d",timeCount);
        }
    })
    // 启动时间源
    timer.resume()
}
