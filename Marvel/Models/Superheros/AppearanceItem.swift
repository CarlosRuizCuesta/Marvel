//
//  AppearanceItem.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class AppearanceItem {
    var resourceURI : String!
    var name : String!
    
    func toEntity() -> AppearanceItemEntity {
        let appearanceItemEntity : AppearanceItemEntity = AppearanceItemEntity()
        
        appearanceItemEntity.resourceURI = self.resourceURI
        appearanceItemEntity.name = self.name
        
        return appearanceItemEntity
    }
}
