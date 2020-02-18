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
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(name: .constant("Banana"), quantity: .constant("4"))
    }
}
