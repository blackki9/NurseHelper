//
//  ManagedPatient+CoreDataProperties.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData

extension ManagedPatient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedPatient> {
        return NSFetchRequest<ManagedPatient>(entityName: "ManagedPatient");
    }

    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var phone: String?
    @NSManaged public var nurse: ManagedNurse?
    @NSManaged public var scheduleItems: ManagedMedicineScheduleItem?

}
