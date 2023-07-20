//
//  Notification.swift
//  NotifHaptics
//
//  Created by Nidya Anifa on 17/07/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let instance = NotificationManager()
    
//    func requestAuthorization() {
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
//            if let error = error {
//                print("ERROR: \(error.localizedDescription)")
//            } else {
//                print("Authorization success")
//            }
//        }
//    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("Authorization success")
                UNUserNotificationCenter.current().delegate = self // Set the delegate here
            }
        }
    }
    
    //call this function to schedule the notification
    
    func makeNotification(subtitle: String) {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification!"
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
        
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
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
            { error in
                if let error = error {
                    print("Notification error: \(error)")
                } else {
                    print("Notification shown")
                }
            }
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound, .badge]) // Show the notification while the app is in the foreground
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
