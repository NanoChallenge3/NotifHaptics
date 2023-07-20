//
//  SimulationView.swift
//  NotifHaptics
//
//  Created by Nidya Anifa on 18/07/23.
//

import SwiftUI

struct SimulationView: View {
    var stationList = ["Lebak Bulus", "Haji Nawi", "ASEAN", "Bendungan Hilir", "Fatmawati"]
    @State private var departureStation = "empty"
    @State private var arrivalStation = "empty"
    @State private var currentStation = "empty"
    @State private var previousStation = "empty"
    
    var notificationManager = NotificationManager()
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text("Departure station:")
                Picker("Departure station", selection: $departureStation) {
                    ForEach(stationList, id: \.self) {
                    Text($0)
                    }
                }.pickerStyle(.wheel)
            }
            
            HStack {
                Text("Arrival station:")
                Picker("Arrival station", selection: $arrivalStation) {
                    ForEach(stationList, id: \.self) {
                    Text($0)
                    }
                }.pickerStyle(.wheel)
            }
            
            HStack {
                Text("Current station:")
                Picker("Current station", selection: $currentStation) {
                    ForEach(stationList, id: \.self) {
                    Text($0)
                    }
                }.pickerStyle(.wheel)
            }
            
        }.onAppear {
            notificationManager.requestAuthorization()
            
        }
        .onChange(of: currentStation) { newStation in
            if newStation == departureStation && newStation != previousStation {
                notificationManager.makeNotification(subtitle: "The train has arrived in departure station")
            }
            if newStation == arrivalStation && newStation != previousStation {
                notificationManager.makeNotification(subtitle: "The train has arrived in arrival station")
            }
            previousStation = newStation
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
