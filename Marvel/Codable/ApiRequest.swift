//
//  ApiRequest.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class ApiRequest : Codable {
    var code : Int!
    var status : String!
    var copyright : String!
    var attributionText : String!
    var attributionHTML : String!
    var etag : String!
    var data : DataCodable!
}
