//
//  Results.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class Result : Codable {
    var id : Int!
    var name : String!
    var description : String!
    var modified : String!
    var thumbnail : Thumbnail!
    var comics : Appearance!
    var series : Appearance!
    var stories : Appearance!
    var events : Appearance!
    var resourceURI : String!
    var urls : [UrlCodable]!
}
