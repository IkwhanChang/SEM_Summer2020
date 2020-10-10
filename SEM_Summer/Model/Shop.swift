//
//  Shop.swift
//  SEM_Summer
//
//  Created by Matthew Chang on 10/7/20.
//  Copyright © 2020 Matthew Chang. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Shop: Hashable, Codable {
    var id: Int
    var name: String
    var imageName: String
    var imageName1: String
    var coordinates: Coordinates
    var address1: String
    var address2: String
    var city: String
    var opening_hours: [OpeningHours]
    var description: String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct OpeningHours: Hashable, Codable {
    var weekName: String
    var open: String
    var close: String
}
