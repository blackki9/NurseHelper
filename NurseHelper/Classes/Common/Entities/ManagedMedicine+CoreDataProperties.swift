//
//  ManagedMedicine+CoreDataProperties.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData


extension ManagedMedicine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedMedicine> {
        return NSFetchRequest<ManagedMedicine>(entityName: "ManagedMedicine");
    }

    @NSManaged public var name: String?

}
