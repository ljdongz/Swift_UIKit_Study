//
//  MemoData+CoreDataProperties.swift
//  ToDoApp
//
//  Created by 이정동 on 2022/09/21.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64

    
    var dateString: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return "" }
        let savedDataString = formatter.string(from: date)
        return savedDataString
    }
}

extension MemoData : Identifiable {

}
