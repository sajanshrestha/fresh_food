//
//  MockDatabase.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/16/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class LocalDatabase: Database {
    
    private let fileManager = FileManager.default
    private let itemsFileName = "GroceryList.txt"
    
    
    func saveItem(item: Item) {
        
        guard let url = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else { return }
        let itemsURL = url.appendingPathComponent("GroceryList")
        
        
        print("\(item.name) is saved to the file.")
    }
    
    func deleteItem(item: Item) {
        print("item deleted")
    }
    
    func getItems() -> [Item] {
        return [
            Item(name: "Banana", quantity: 3, purchaseDate: Date()),
            Item(name: "Cherry", quantity: 1, purchaseDate: Date()),
            Item(name: "Orange", quantity: 12, purchaseDate: Date()),
            Item(name: "Bacon", quantity: 1, purchaseDate: Date())
        ]
    }
    
    func updateItem(item: Item) {
        print("Item updated")
    }
    
    
}
