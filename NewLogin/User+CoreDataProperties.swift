//
//  User+CoreDataProperties.swift
//  NewLogin
//
//  Created by Marlon Escobar on 2019-04-30.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String
    @NSManaged public var password: String

}
