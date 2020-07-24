//
//  Results.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class CodableResult : Codable {
    var id : Int!
    var name : String!
    var description : String!
    var modified : String!
    var thumbnail : CodableThumbnail!
    var comics : CodableAppearance!
    var series : CodableAppearance!
    var stories : CodableAppearance!
    var events : CodableAppearance!
    var resourceURI : String!
    var urls : [CodableUrl]!
}
