//
//  UrlEntity.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 29/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class UrlEntity : Object {
   @objc dynamic var type : String!
   @objc dynamic var url : String!
    
    func toModel() -> Url {
        let url : Url = Url()
        
        url.type = self.type
        url.url = self.url
        
        return url
    }
}
