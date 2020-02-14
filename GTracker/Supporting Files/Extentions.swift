//
//  Extentions.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

extension Int {
    func getNumberOfSeconds() -> Int {
        self * 86400
    }
}

extension Date {
    func getMediumFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
