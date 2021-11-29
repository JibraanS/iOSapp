//
//  Recipe.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
//

import CoreData

class Recipe {
    var name: String
    var time: String
    var description: String
    var type: String // breakfast, lunch, dinner
    var tags: [String]
    var ingredients: [String]
    var directions: [String]
    
    init(_name: String, _time: String, _desc: String, _type: String, _tags: [String], _ingredients: [String], _dirs: [String]) {
        self.name = _name
        self.time = _time
        self.description = _desc
        self.type = _type
        self.tags = _tags
        self.ingredients = _ingredients
        self.directions = _dirs
    }
}
