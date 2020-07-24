//
//  Data.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class DataCodable : Codable {
    var offset : Int!
    var limit : Int!
    var total : Int!
    var count : Int!
    var results : [Result]!
}
