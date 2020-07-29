//
//  Url.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class Url {
    var type : String!
    var url : String!
    
    func toEntity() -> UrlEntity {
        let urlEntity : UrlEntity = UrlEntity()
        
        urlEntity.type = self.type
        urlEntity.url = self.url
        
        return urlEntity
    }
}
