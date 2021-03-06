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
            if let entityHero = realm.objects(HeroEntity.self).filter("name == %@", name.capitalized).first {
                let hero = entityHero.toModel()
                return hero
            }
            
            return nil
            
            
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
    
    class func deleteHero(hero : Hero) {
        do {
            let realm = try Realm()
            
            if let entityHero = realm.objects(HeroEntity.self).filter("name = %@", hero.name).first {
                try! realm.write {
                    realm.delete(entityHero)
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    class func getHeroes() -> [Hero]? {
        do {
            let realm = try Realm()
            let HeroesEntity : Results<HeroEntity> = realm.objects(HeroEntity.self)
            var heroes : [Hero] = []
            
            for HeroEntity in HeroesEntity.reversed() {
                heroes.append(HeroEntity.toModel())
            }
            
            if heroes.count > 0 {
                return heroes
            }
            
            return nil
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
}
