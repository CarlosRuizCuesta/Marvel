//
//  MarvelApiHeroes.swift
//  Marvel
//
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class MarvelApiHeroes : MarvelApi {
        static var URL = "https://gateway.marvel.com:443/v1/public/characters"
        static var PARAM_NAME = "name"
        
        var name : String!
        
        init(delegate : MarvelApiResponse, name : String) {
            super.init(delegate : delegate, url : MarvelApiHeroes.URL)
            self.name = name
            super.url?.queryItems?.append(
                URLQueryItem(name: MarvelApiHeroes.PARAM_NAME, value: self.name)
            )
        }
}
