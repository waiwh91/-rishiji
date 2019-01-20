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
    
    public init(date: NSDate, text: String) {
        self.date = date
        self.text = text
    }
    
    override public init() {
        self.date = NSDate()
        self.text = ""
    }
    
    // MARK: --实现NSCoding协议
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(text, forKey: "text")
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "date") as! NSDate
        self.text = aDecoder.decodeObject(forKey: "text") as! String
    }
    
}
