//
//  Notes+CoreDataProperties.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/26.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var types: Int32

}
