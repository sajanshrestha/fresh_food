//
//  UpdateButton.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct UpdateButton: View {
    
    @Binding var showPickerView: Bool
    let updateTitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            if self.showPickerView {
                self.action()
            }
            withAnimation(Animation.spring()) {
                self.showPickerView.toggle()
            }
        }, label: {
            Text(showPickerView ? "Save" : updateTitle)
            .modifier(CustomButton())
        })
    }
}

//struct UpdateButton_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateButton(showPicker: true, action: )
//    }
//}

