//
//  ContentData.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/22/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation
import ObjectMapper

class listResponse: Mappable {
    var title: String?
    var rows: [Details]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        rows <- map["rows"]
    }
}

class Details: Mappable {
    var title: String?
    var description: String?
    var imageHref: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        imageHref <- map["imageHref"]
    }
}
