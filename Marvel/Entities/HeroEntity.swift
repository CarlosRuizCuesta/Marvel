import Foundation
import RealmSwift


class HeroEntity : Object {
    
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String!
    @objc dynamic var desc : String!
    @objc dynamic var modified : String!
    @objc dynamic var image : String!
    @objc dynamic var comics : AppearanceEntity!
    @objc dynamic var series : AppearanceEntity!
    @objc dynamic var stories : AppearanceEntity!
    @objc dynamic var events : AppearanceEntity!
    @objc dynamic var creators : AppearanceEntity!
    @objc dynamic var characters : AppearanceEntity!
    @objc dynamic var resourceURI : String!
    @objc dynamic var url : UrlEntity!
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func toModel() -> Hero {
        
        let hero : Hero = Hero()
        
        hero.id = self.id
        hero.name = self.name
        hero.description = self.desc
        hero.modified = self.modified
        hero.image = self.image
        
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
        
        if let url = self.url {
            hero.url = url.toModel()
        }
        
        hero.from = .database
        
        return hero
    }
}
