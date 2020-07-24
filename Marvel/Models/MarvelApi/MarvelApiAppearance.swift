//
//  MarvelApiAppearance.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class MarvelApiAppearance : MarvelApi {
    static var URL : String = "https://gateway.marvel.com:443/v1/public/comics/"
    
    var id : String!
    
    init(delegate : MarvelApiResponse, id : String) {
        super.init(delegate : delegate, url : MarvelApiAppearance.URL + id)
    }
    
}
