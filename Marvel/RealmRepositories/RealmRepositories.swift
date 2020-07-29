//
//  RealmRepositories.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 29/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class RealmRepositories {
    
    
    class func saveHero(hero : Hero) {
        
        do {
            let realm = try Realm()
            try  realm.write {
                realm.add(hero.toEntity(), update: .all)
            }
        } catch _ as NSError {
            print("Error saving hero")
        }
    }
    
    class func getHero(name : String) -> Hero? {
        do {
            let realm = try Realm()
            if let entityHero = realm.objects(HeroEntity.self).filter("name == %@", name).first {
                let hero = entityHero.toModel()
                return hero
            }
            
            return nil
            
            
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
}
