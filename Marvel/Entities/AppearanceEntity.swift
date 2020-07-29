//
//  AppearanceEntity.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 29/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class AppearanceEntity : Object {
    @objc dynamic var available : Int = 0
    @objc dynamic var collectionURI : String!
    var items = List<AppearanceItemEntity>()
    
    
    func toModel() -> Appearance {
        let apparence : Appearance = Appearance()
        
        apparence.available = self.available
        apparence.collectionURI = self.collectionURI
        
        for item in items {
            apparence.items.append(item.toModel())
        }
        
        return apparence
        
    }
}
