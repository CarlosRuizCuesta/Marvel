//
//  AppearanceItemEntity.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 29/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class AppearanceItemEntity : Object {
    @objc dynamic var resourceURI : String!
    @objc dynamic var name : String!
    
    func toModel() -> AppearanceItem {
        
        let appearanceItem : AppearanceItem = AppearanceItem()
        
        appearanceItem.resourceURI = self.resourceURI
        appearanceItem.name = self.name
        
        return appearanceItem
    }
}
