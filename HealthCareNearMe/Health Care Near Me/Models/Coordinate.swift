//
//  Coordinate.swift
//  Health Care Near Me
//
//  Created by Romell Bolton on 5/1/17.
//  Copyright © 2017 Romell Bolton. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
