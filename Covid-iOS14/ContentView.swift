//
//  ContentView.swift
//  Covid-iOS14
//
//  Created by Matthew Garlington on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()

    var body: some View {

        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    
                    Text("Maryland")
                        .font(.system(size: 23, weight: .bold))
                        .padding(10)
                    
                    ForEach(networkManager.covidInfo.sorted( by: { $1.created_at < $0.created_at}), id: \.self) { covidInfo in
                        if covidInfo.state == "MD" {
                            NavigationLink(destination: DestinationView(covidInfo: covidInfo)
                                           , label: {
                                CovidStateLabel(dateLabel: covidInfo.created_at)
                            })
                        }
                    }
                }
            }
            .onAppear {
                networkManager.fetch()
            }
            .navigationBarTitle(Text("Covid Data"))
        }
    }
}

struct DestinationView: View {
    var covidInfo: CovidInfo
    var body: some View {
        VStack(spacing: 20) {
            ForEach(states.sorted(by: ==), id: \.key) { key, value in
                if covidInfo.state == key {
                    Text(value)
                        .font(.largeTitle)
                        .bold()
                }
            }
            
            Text(String(Int(covidInfo.tot_cases) ?? 0))
            
            Text("\(covidInfo.created_at)")
            
        }
    }
}

struct CovidStateLabel: View {
    var dateLabel: String
    var body: some View {
        
        ZStack {
            Text("\(changeStringToDate(dateLabel: dateLabel))")
        }
    }
    
    func changeStringToDate(dateLabel: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let calendar = Calendar.current
        let date = dateFormatter.date(from: dateLabel)!
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let finalDate = calendar.date(from:components)
        
        
        return finalDate!.formatted(date: .abbreviated, time: .shortened)
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


