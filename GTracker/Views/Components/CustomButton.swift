//
//  CustomButton.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CustomButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
            .frame(width: UIScreen.main.bounds.width - 20)
            .background(Color.green)
            .cornerRadius(5)
            .foregroundColor(.black)
    }
}

