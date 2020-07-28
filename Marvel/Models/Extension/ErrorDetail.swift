//
//  errorDetail.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 28/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class ErrorDetails : Error {
    enum errorEnum : String {
        case httpurlResponse = "Internet connection error"
        case statusCode = "Error with the Marvel API"
        case decoderError = "Error getting the data"
        case zeroResult = "No results for the search"
    }
    
    var message : String!
    
    init(errorEnum : errorEnum) {
        message = errorEnum.rawValue
    }
}
