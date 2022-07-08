//
//  RoomsResponce.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation

struct RoomsResponce: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}
