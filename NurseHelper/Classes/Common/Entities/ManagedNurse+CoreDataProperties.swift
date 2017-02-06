//
//  ManagedNurse+CoreDataProperties.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData

extension ManagedNurse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedNurse> {
        return NSFetchRequest<ManagedNurse>(entityName: "ManagedNurse");
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var patients: NSSet?

}

// MARK: Generated accessors for patients
extension ManagedNurse {

    @objc(addPatientsObject:)
    @NSManaged public func addToPatients(_ value: ManagedPatient)

    @objc(removePatientsObject:)
    @NSManaged public func removeFromPatients(_ value: ManagedPatient)

    @objc(addPatients:)
    @NSManaged public func addToPatients(_ values: NSSet)

    @objc(removePatients:)
    @NSManaged public func removeFromPatients(_ values: NSSet)

}
