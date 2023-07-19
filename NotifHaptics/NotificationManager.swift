//
//  Notification.swift
//  NotifHaptics
//
//  Created by Nidya Anifa on 17/07/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("Authorization success")
            }
        }
    }
    
    func makeNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification!"
        content.subtitle = "Train has arrived!"
        content.sound = .default
//        content.badge = 1
        
//        //location based notification
//        let coordinates = CLLocationCoordinate2D(
//            latitude: -6.30208603,
//            longitude: 106.652264)
//
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 500,
//            identifier: UUID().uuidString)
//
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        //time based notification
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

//
//struct Notification: View {
//    var body: some View {
//        VStack(spacing: 40) {
//            Button("Start Journey") {
//                NotificationManager.instance.makeNotification()
//            }
//            Button("Cancel Notification") {
//                NotificationManager.instance.cancelNotification()
//            }
//        }
//        .onAppear {
//            NotificationManager.instance.requestAuthorization()
//        }
//    }
//}
//
//struct Notification_Previews: PreviewProvider {
//    static var previews: some View {
//        Notification()
//    }
//}
