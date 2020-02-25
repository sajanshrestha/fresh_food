//
//  DetailView.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/17/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var item: Item
    var quantities = Array(0...50)
    var numberOfDays = Array(0...50)
    
    @State private var showQuantityPicker = false
    
    @State private var showEdibleNumberOfDaysPicker = false
    @State private var edibleLifeSet = false

    @State private var selected = 0
    
    @EnvironmentObject var groceryTracker: GroceryTracker
    @EnvironmentObject var publisher: NotificationPublisher

    var body: some View {
        ZStack {

            BackgroundImage()
            
            VStack(alignment: .leading, spacing: 8) {
                
                ItemInfoRow(infoTitle: "Item", infoValue: item.name)
                ItemInfoRow(infoTitle: "Quantity", infoValue: "\(quantities[selected])")
                ItemInfoRow(infoTitle: "Date", infoValue: item.purchaseDate.getMediumFormat())
                
                if showQuantityPicker {
                    PickerView(selected: $selected, list: quantities)
                }
                
                UpdateButton(showPickerView: $showQuantityPicker, updateTitle: "Update Quantity") {
                    self.updateQuantity()
                }
                
                if showEdibleNumberOfDaysPicker {
                    PickerView(selected: $selected, list: numberOfDays)
                }
                
                if item.bestByDate == nil {
                    UpdateButton(showPickerView: $showEdibleNumberOfDaysPicker, updateTitle: "Set Best By Date") {
                        self.setEdibleNumberOfDays()
                        self.scheduleNotification()
                        withAnimation(Animation.easeInOut(duration: 0.6)) {
                            self.edibleLifeSet = true
                        }
                    }
                }
                else {
                    Text("Best by date has been set for this item.")
                }
                
                if edibleLifeSet {
                    NotificationSavedMessageView().padding()
                }
            }
            .padding(.horizontal)
            .onAppear {
                self.selected = self.item.quantity
            }
        }
    }
}
extension DetailView {
    
    func updateQuantity() {
        let newItem = Item(name: item.name, quantity: quantities[selected], purchaseDate: item.purchaseDate, category: item.category)
        groceryTracker.updateItem(item: item, with: newItem)
    }
    
    func setEdibleNumberOfDays() {
        let newItem = Item(name: item.name, quantity: item.quantity, purchaseDate: item.purchaseDate, bestByDate: numberOfDays[selected], category: item.category)
        groceryTracker.updateItem(item: item, with: newItem)
    }
    
    // if the item has life, then the notification is set
    func scheduleNotification() {
        guard let bestByDays = item.bestByDate else { return }
        let notification = Notification(title: "Food Alert", subtitle: nil, body: "\(item.name) is going bad", timeInterval: bestByDays.getNumberOfSeconds())
        publisher.scheduleNotification(withIdentifier: "Food Notification", notification: notification)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item(name: "banana", quantity: 2, purchaseDate: Date(), category: .other))
    }
}

