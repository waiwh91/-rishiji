//
//  Texts+CoreDataProperties.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/16.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//
//

import Foundation
import CoreData


extension Texts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Texts> {
        return NSFetchRequest<Texts>(entityName: "Texts")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var text: String?

}
