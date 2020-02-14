//
//  PickerView.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var selected: Int
    
    var list: [Int]
    
    var body: some View {
        Picker(selection: $selected, label: Text("")) {
            ForEach(list, id: \.self) { item in
                Text("\(item)")
            }
        }
        .foregroundColor(.black)
        .font(.headline)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selected: .constant(0), list: [1,2,3])
    }
}
