//
//  AppearanceItem.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class CodableAppearanceItem : Codable {
    var resourceURI : String!
    var name : String!
    
    func toModel() -> AppearanceItem {
        let appearanceItem = AppearanceItem()
        
        appearanceItem.resourceURI = self.resourceURI
        appearanceItem.name = self.name
        
        return appearanceItem
    }
}
