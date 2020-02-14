//
//  NotificationPublisher.swift
//  LocalNotificaitonTwo
//
//  Created by Sajan Shrestha on 1/15/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import SwiftUI
import UserNotifications

class NotificationPublisher: NSObject, ObservableObject {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    private enum NotificationAction: String {
        case accept = "Ok"
    }
        
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Authorization granted")
            }
            else {
                print(error?.localizedDescription ?? "error")
            }
        }
    }
    
    func scheduleNotification(withIdentifier identifier: String, notification: Notification) {
        
        notificationCenter.delegate = self
           
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.body ?? ""
        content.categoryIdentifier = identifier
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(notification.timeInterval ?? 1), repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
        
        addCategory(withIdenfier: identifier)
    }
    
    func addCategory(withIdenfier identifier: String) {
        let acceptAction = UNNotificationAction(identifier: NotificationAction.accept.rawValue, title: NotificationAction.accept.rawValue, options: .foreground)
        let meetingInvitationCategory = UNNotificationCategory(identifier: identifier, actions: [acceptAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: [.customDismissAction])
        notificationCenter.setNotificationCategories([meetingInvitationCategory])
    }
    
    func removeAllNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
}

extension NotificationPublisher: NotificationScheduler, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification will be presented")
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let actionIdentifier = response.actionIdentifier
                
        switch actionIdentifier {
        case NotificationAction.accept.rawValue:
            print("accepted")
        default:
            print("the user tapped the notification")
        }
        completionHandler()
    }
}
