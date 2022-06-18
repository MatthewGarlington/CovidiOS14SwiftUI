//
//  NetworkManager.swift
//  Covid-iOS14
//
//  Created by Matthew Garlington on 6/12/22.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var covidInfo: [CovidInfo] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://data.cdc.gov/resource/9mfq-cb36.json")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CovidInfo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error! \(error.localizedDescription)")
                }
            } receiveValue: { [unowned self] covidInfoReceived in
                covidInfo = covidInfoReceived
                print("Success!!!")
            }
            .store(in: &cancellables)
    }
}
