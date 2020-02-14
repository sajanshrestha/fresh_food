//
//  ItemInfoRow.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ItemInfoRow: View {
    
    var infoTitle: String
    var infoValue: String
    
    var body: some View {
        VStack {
            HStack {
                Text(infoTitle)
                Spacer()
                Text(infoValue)
            }
            Divider()
        }
    }
}

struct ItemInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemInfoRow(infoTitle: "Item", infoValue: "Banana")
    }
}
