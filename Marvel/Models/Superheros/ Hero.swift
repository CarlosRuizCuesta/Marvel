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
}
