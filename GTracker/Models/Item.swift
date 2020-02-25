//
//  Item.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/16/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct Item: Identifiable, Codable {
    
    enum Category: String, Codable {
        case fruit = "Fruit"
        case vegetable = "Vegetable"
        case other = "Other"
    }
    
    var id = UUID()
    var name: String
    var quantity: Int
    var purchaseDate: Date
    var bestByDate: Int?
    var category: Category
    
    var isPastBestByDate: Bool {
        guard let bestByDate = bestByDate else { return false }
        
        let pastByDate = purchaseDate.addingTimeInterval(TimeInterval(bestByDate.getNumberOfSeconds()))
        
        return Date() > pastByDate
    }
}
