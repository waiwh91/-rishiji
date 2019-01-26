//
//  riji.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/12/21.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import Foundation

public class riji: NSObject,NSCoding {
    
    public var date: NSDate
    public var text: String
    public var mood :String

    public init(date: NSDate, text: String, mood: String) {
        self.date = date
        self.text = text
        self.mood = mood
    }
    
    override public init() {
        self.date = NSDate()
        self.text = ""
        self.mood = ""
    }
    
    // MARK: --实现NSCoding协议
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(mood, forKey: "mood")    }
    
    public required init(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "date") as! NSDate
        self.text = aDecoder.decodeObject(forKey: "text") as! String
        self.mood = aDecoder.decodeObject(forKey: "mood") as! String    }
    
}
