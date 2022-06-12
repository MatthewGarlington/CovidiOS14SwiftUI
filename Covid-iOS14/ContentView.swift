//
//  ContentView.swift
//  Covid-iOS14
//
//  Created by Matthew Garlington on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()
    var dateFetched: Date = .now
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(networkManager.covidInfo.sorted( by: { $0.state < $1.state}), id: \.self) { entry in
                    NavigationLink(entry.state) {
                        VStack {
                            ForEach(states.sorted(by: ==), id: \.key) { key, value in
                                if entry.state == key {
                                    Text(value)
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
            .onAppear {
                networkManager.fetch(dateFetched: "2022-01-14T00:00:00.000")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let states = [
    "AK" : "Alaska",
    "AL" : "Alabama",
    "AR" : "Arkansas",
    "AS" : "American Samoa",
    "AZ" : "Arizona",
    "CA" : "California",
    "CO" : "Colorado",
    "CT" : "Connecticut",
    "DC" : "District of Columbia",
    "DE" : "Delaware",
    "FL" : "Florida",
    "GA" : "Georgia",
    "GU" : "Guam",
    "HI" : "Hawaii",
    "IA" : "Iowa",
    "ID" : "Idaho",
    "IL" : "Illinois",
    "IN" : "Indiana",
    "KS" : "Kansas",
    "KY" : "Kentucky",
    "LA" : "Louisiana",
    "MA" : "Massachusetts",
    "MD" : "Maryland",
    "ME" : "Maine",
    "MI" : "Michigan",
    "MN" : "Minnesota",
    "MO" : "Missouri",
    "MS" : "Mississippi",
    "MT" : "Montana",
    "NC" : "North Carolina",
    "ND" : "North Dakota",
    "NE" :"Nebraska",
    "NH" :"New Hampshire",
    "NJ" :"New Jersey",
    "NM" :"New Mexico",
    "NV" : "Nevada",
    "NY" : "New York",
    "OH" :"Ohio",
    "OK" :"Oklahoma",
    "OR" : "Oregon",
    "PA" : "Pennsylvania",
    "PR" :"Puerto Rico",
    "RI" : "Rhode Island",
    "SC" : "South Carolina",
    "SD" : "South Dakota",
    "TN" : "Tennessee",
    "TX" : "Texas",
    "UT" : "Utah",
    "VA" : "Virginia",
    "VI" : "Virgin Islands",
    "VT" : "Vermont",
    "WA" : "Washington",
    "WI" : "Wisconsin",
    "WV" : "West Virginia",
    "WY" : "Wyoming"
]
