//
//  LocalDatabase.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/17/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import SwiftUI

class GroceryTracker: ObservableObject {
    
    @Published var items = [Item]()

    private let fileManager = FileManager.default
    
    private lazy var itemsURL: URL? = {
        guard let url = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else { return nil}
        let itemsURL = url.appendingPathComponent("GroceryList.txt")
        return itemsURL
    }()
        
    init() {
        
        guard let itemsURL = itemsURL else { return }
        guard let data = try? Data(contentsOf: itemsURL ) else {return}
        guard let savedItems = try? PropertyListDecoder().decode([Item].self, from: data) else {return}
        self.items.append(contentsOf: savedItems)
    }

    func save(items: [Item]) {
        
        guard let itemsURL = itemsURL else { return }
        guard let itemsData = try? PropertyListEncoder().encode(items) else {return}
        try? itemsData.write(to: itemsURL)
    }
    
    func addItem(item: Item) {
        items.append(item)
        save(items: items)
    }
    
    func updateItem(item: Item, with newItem: Item) {
        var newListOfItems = [Item]()
        
        items.forEach { savedItem in
            if savedItem.id == item.id {
                newListOfItems.append(newItem)
            }
            else {
                newListOfItems.append(savedItem)
            }
        }
        
        items = newListOfItems
        save(items: newListOfItems)
    }
    
}

