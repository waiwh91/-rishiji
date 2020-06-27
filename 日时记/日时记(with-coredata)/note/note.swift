//
//  note.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/25.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit
import Foundation

public class note: NSObject,NSCoding {
    
    public var date: Date
    public var text: String
    public var types :Int32

    public init(date: Date, text: String, types: Int32) {
        self.date = date
        self.text = text
        self.types = types
    }
    
    override public init() {
        self.date = Date()
        self.text = ""
        self.types = 0
    }
    
    // MARK: --实现NSCoding协议
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(types, forKey: "types")    }
    
    public required init(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "date") as! Date
        self.text = aDecoder.decodeObject(forKey: "text") as! String
        self.types = aDecoder.decodeObject(forKey: "types") as! Int32    }
    
}

