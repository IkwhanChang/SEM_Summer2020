//
//  Shop.swift
//  SEM_Summer
//
//  Created by Matthew Chang on 10/7/20.
//  Copyright © 2020 Matthew Chang. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Coffee: Hashable, Codable {
    var id: Int
    var name: String
    var imageName: String
    var sub: String
    var description: String
    var price: Float

}

