//
//  NotificationSavedMessageView.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct NotificationSavedMessageView: View {
    var body: some View {
        HStack {
            Text("Edible life is set!")
                .font(.headline)
            Image(systemName: "timer")
                .foregroundColor(.green)
                .font(.title)
        }
    }
}

struct NotificationSavedMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSavedMessageView()
    }
}
