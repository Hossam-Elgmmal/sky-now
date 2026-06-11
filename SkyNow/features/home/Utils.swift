//
//  Utils.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


func tempString(_ value: Double?) -> String {
    guard let v = value else { return "—" }
    return "\(Int(v.rounded()))°"
}

func dayName(from dateString: String?) -> String {
    guard let str = dateString else { return "—" }
    let f = DateFormatter(); f.dateFormat = "yyyy-MM-dd"
    guard let date = f.date(from: str) else { return "—" }
    let out = DateFormatter(); out.dateFormat = "EEE"
    return out.string(from: date)
}
