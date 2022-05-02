//
//  BusinessSearch.swift
//  M6
//
//  Created by idan Cohen on 02/05/2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
