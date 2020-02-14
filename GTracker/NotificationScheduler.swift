//
//  NotificationScheduler.swift
//  LocalNotificaitonTwo
//
//  Created by Sajan Shrestha on 1/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

protocol NotificationScheduler {
    
    func requestAuthorization()
    
    func scheduleNotification(withIdentifier identifier: String, notification: Notification)
    
    func addCategory(withIdenfier identifier: String)
    
    func removeAllNotifications() 
}
