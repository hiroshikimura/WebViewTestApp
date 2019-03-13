//
//  URLHistory+CoreDataProperties.swift
//  WebViewTestApp
//
//  Created by 木村洋 on 2016/07/11.
//  Copyright © 2016年 木村洋. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension URLHistory {

    @NSManaged var timestamp: NSNumber?
    @NSManaged var url: String?

}
