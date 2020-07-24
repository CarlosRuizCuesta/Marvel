//
//  Appearances.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class Appearance : Codable {
    var available : Int!
    var collectionURI : String!
    var items : [AppearanceItem]!
}
