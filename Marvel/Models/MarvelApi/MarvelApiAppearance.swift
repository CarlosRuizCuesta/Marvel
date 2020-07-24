//
//  MarvelApiAppearance.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class MarvelApiAppearance : MarvelApi {
    var urlProtocol : String!
    
    override init(delegate : MarvelApiResponse, url : String) {
        self.urlProtocol = url
        self.urlProtocol.insert(contentsOf: "s", at: self.urlProtocol.lastIndexOf("://")!)
        self.urlProtocol.insert(contentsOf: ":443", at: self.urlProtocol.lastIndexOf("/v1")!)
        super.init(delegate : delegate, url : self.urlProtocol) //"https://gateway.marvel.com:443/v1/public/comics/43495"
    }
    
}
