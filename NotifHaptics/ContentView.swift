//
//  ContentView.swift
//  NotifHaptics
//
//  Created by Nidya Anifa on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    var notificationManager = NotificationManager()
    @StateObject var locationManager = LocationManager()
    
    var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }
        
        var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Start Journey") {
                NotificationManager.instance.makeNotification()
            }
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
            
            Text("location status: \(locationManager.statusString)")
                HStack {
                    Text("latitude: \(userLatitude)")
                    Text("longitude: \(userLongitude)")
                    }
        }
        .onAppear {
            NotificationManager.instance.requestAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
