//
//  Appearances.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class CodableAppearance : Codable {
    var available : Int!
    var collectionURI : String!
    var items : [CodableAppearanceItem]!
    
    
    func toModel() -> Appearance {
        let appearance = Appearance()
        
        appearance.available = self.available
        appearance.collectionURI = self.collectionURI
        
        for item in items {
            appearance.items.append(item.toModel())
        }
        
        return appearance
    }
}
