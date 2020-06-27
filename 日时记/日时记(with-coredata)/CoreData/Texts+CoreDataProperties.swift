//
//  Texts+CoreDataProperties.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/26.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//
//

import Foundation
import CoreData


extension Texts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Texts> {
        return NSFetchRequest<Texts>(entityName: "Texts")
    }

    @NSManaged public var date: Date?
    @NSManaged public var mood: String?
    @NSManaged public var text: String?

}
