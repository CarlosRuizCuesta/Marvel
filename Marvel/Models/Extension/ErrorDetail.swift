//
//  errorDetail.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 28/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class ErrorDetails : Error {
    enum errorEnum {
        case httpurlResponse
        case statusCode
        case decoderError
        case zeroResult
    }
    
    var message : String!
    
    init(errorEnum : errorEnum) {
        switch errorEnum {
        case .httpurlResponse:
            message = NSLocalizedString("Internet connection error", comment: "")
        case .statusCode:
            message = NSLocalizedString("Error with the Marvel API", comment: "")
        case .decoderError:
            message = NSLocalizedString("Error getting the data", comment: "")
        case .zeroResult:
            message = NSLocalizedString("No results for the search", comment: "")
        default:
            message = ""
        }
    }
}
