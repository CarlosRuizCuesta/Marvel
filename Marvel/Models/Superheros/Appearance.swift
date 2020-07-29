//
//  Appearance.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class Appearance {
    var available : Int!
    var collectionURI : String!
    var items : [AppearanceItem]! = []
    
    func toEntity() -> AppearanceEntity {
        let apparanceEntity : AppearanceEntity = AppearanceEntity()
        
        if let available = self.available {
            apparanceEntity.available = self.available
        }
        
        apparanceEntity.collectionURI = self.collectionURI
        
        for item in items {
            apparanceEntity.items.append(item.toEntity())
        }
        
        return apparanceEntity
    }
    
    
    func getType() -> String {
        let fullUri = collectionURI.components(separatedBy: "/")
        return fullUri[fullUri.count-1]
    }
}
