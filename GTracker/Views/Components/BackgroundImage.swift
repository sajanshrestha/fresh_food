//
//  BackgroundImage.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("grocery")
            .resizable()
            .scaledToFit()  
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 5)
            .opacity(0.5)
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
