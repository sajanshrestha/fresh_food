//
//  AddItemView.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    
    @Binding var name: String
    @Binding var quantity: String
    @State private var selected = 2
    var items = ["Fruit", "Vegetable", "Other"]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Item")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -8, trailing: 0))
            TextField("", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -4, trailing: 0))
            Text("Quantity")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -8, trailing: 0))
            TextField("", text: $quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            Picker(selection: $selected, label: Text("")) {
                ForEach(0..<items.count, id: \.self) {
                    Text(self.items[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(name: .constant("Banana"), quantity: .constant("4"))
    }
}
