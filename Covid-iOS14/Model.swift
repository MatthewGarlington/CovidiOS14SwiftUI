//
//  Model.swift
//  Covid-iOS14
//
//  Created by Matthew Garlington on 6/12/22.
//

import Foundation

struct CovidInfo: Hashable, Decodable {
    var submission_date: String
    var state: String
    var tot_cases: String
    var conf_cases: String?
    var prob_cases: String?
    var new_case: String?
    var pnew_case: String?
    var tot_death: String?
    var pnew_death: String?
    var created_at: String
    var consent_cases: String?
    var consent_deaths: String?
}
