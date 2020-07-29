//
//   Hero.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class Hero {
    var id : Int!
    var name : String!
    var description : String!
    var modified : String!
    var image : String!
    var comics : Appearance!
    var series : Appearance!
    var stories : Appearance!
    var events : Appearance!
    var creators : Appearance!
    var characters : Appearance!
    var resourceURI : String!
    var url : Url!
    var from : HeroFrom!
    
    
    func toEntity() -> HeroEntity {
        let heroEntity : HeroEntity = HeroEntity()
        heroEntity.id = self.id
        heroEntity.name = self.name
        heroEntity.desc = self.description
        heroEntity.modified = self.modified
        heroEntity.image = self.image
        
        if let comics = self.comics {
            heroEntity.comics = comics.toEntity()
        }
        
        if let series = self.series {
            heroEntity.series = series.toEntity()
        }
        
        if let stories = self.stories {
            heroEntity.stories = stories.toEntity()
        }
        
        if let events = self.events {
            heroEntity.events = events.toEntity()
        }
        
        if let creators = self.creators {
            heroEntity.creators = creators.toEntity()
        }
        
        if let characters = self.characters {
            heroEntity.characters = characters.toEntity()
        }
        if let url = self.url {
            heroEntity.url = self.url.toEntity()
        }
        
        return heroEntity
    }
    
    func sectionAppearance() -> [Appearance] {
        
        var sections : [Appearance] = []
        
        if let comics = comics {
            
            if comics.available != nil {
                if comics.available > 0 {
                    sections.append(comics)
                }
            }
        }
        
        if let series = series {
            if series.available != nil {
                if series.available > 0 {
                sections.append(series)
                }
                
            }
        }
        
        if let stories = stories {
            if stories.available != nil {
                if stories.available > 0 {
                    sections.append(stories)
                }
            }
        }
        
        if let events = events {
            if events.available != nil {
                if events.available > 0 {
                    sections.append(events)
                }
            }
        }
        
        if let creators = creators {
            if creators.available != nil {
                if creators.available > 0 {
                    sections.append(creators)
                }
            }
        }
        
        if let characters = characters {
            if characters.available != nil {
                if characters.available > 0 {
                    sections.append(characters)
                }
            }
        }
        
        return sections
    }
    
    enum HeroFrom {
        case database
        case apiMarvel
    }
}
