//
//  Results.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class CodableResult : Codable {
    var id : Int!
    var name : String!
    var description : String!
    var modified : String!
    var thumbnail : CodableThumbnail!
    var comics : CodableAppearance!
    var series : CodableAppearance!
    var stories : CodableAppearance!
    var events : CodableAppearance!
    var creators : CodableAppearance!
    var characters : CodableAppearance!
    var resourceURI : String!
    var urls : [CodableUrl]!
    var difitalID : Int!
    var title : String!
    var issueNumber : Int!
    var variantDescription : String!
    var isbn : String!
    var upc : String!
    var diamondCode : String!
    var ean : String!
    var issn : String!
    var format : String!
    var pageCount : Int!
    
    
    
    func toModel() -> Hero {
        var hero = Hero()
        
        hero.id = self.id
        hero.name = self.name
        hero.description = self.description
        hero.modified = self.modified
        
        if let comics = self.comics {
            hero.comics = comics.toModel()
        }
        
        if let series = self.series {
            hero.series = series.toModel()
        }
        
        if let stories = self.stories {
            hero.stories = stories.toModel()
        }
        
        if let events = self.events {
            hero.events = events.toModel()
        }
        
        if let creators = self.creators {
            hero.creators = creators.toModel()
        }
        
        if let characters = self.characters {
            hero.characters = characters.toModel()
        }
        
        hero.resourceURI = self.resourceURI
        
        if let thumbnail = thumbnail {
            if thumbnail.path != nil {
                thumbnail.path.insert(contentsOf: "s", at: self.thumbnail.path.lastIndexOf("://")!)
                hero.image = thumbnail.path + "/landscape_incredible.jpg"
            }
        }
        
        hero.from = .apiMarvel
        
        return hero
    }
}
