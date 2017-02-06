//
//  ManagedMedicineScheduleItem+CoreDataProperties.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData

extension ManagedMedicineScheduleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedMedicineScheduleItem> {
        return NSFetchRequest<ManagedMedicineScheduleItem>(entityName: "ManagedMedicineScheduleItem");
    }

    @NSManaged public var time: Int16
    @NSManaged public var dosage: Int16
    @NSManaged public var priority: Int16
    @NSManaged public var medicine: ManagedMedicine?

}
