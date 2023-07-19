//
//  SimulationView.swift
//  NotifHaptics
//
//  Created by Nidya Anifa on 18/07/23.
//

import SwiftUI

struct SimulationView: View {
    var stationList = ["Lebak Bulus", "Haji Nawi", "ASEAN", "Bendungan Hilir", "Fatmawati"]
    @State private var departureStation = "Lebak Bulus"
    @State private var arrivalStation = "Lebak Bulus"
    @State private var currentStation = "Lebak Bulus"
    
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
            
        }.onChange(of: currentStation, perform: { newStation in
            if newStation == departureStation {
                notificationManager.makeNotification()
            }
        })
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
