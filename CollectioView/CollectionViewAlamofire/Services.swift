//
//  Services.swift
//  CollectionViewAlamofire
//
//  Created by SCOTT E RESH on 3/7/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

struct Keys {
    
   static let serviceID  = "serviceID"
   static let categoryID = "categoryID"
   static let desc       = "desc"
   static let title      = "title"
   static let image      = "image"
    
}

class Services: NSObject, NSCoding {
    
    //===== To use keyed archiever the class/protocol should conform to the NSCoding type=====
    
    var serviceID:  Int     = 0
    var categoryID: Int     = 0
    var desc:       String  = ""
    var title:      String  = ""
    var image:      String  = ""
    
    
     init(serviceID: Int, categoryID: Int, desc: String, title: String, image: String) {
        
        self.serviceID  = serviceID
        self.categoryID = categoryID
        self.desc       = desc
        self.title      = title
        self.image      = image

    }
    
    
    //=====read from disk==
    
    required init(coder aDecoder: NSCoder) {
        
        serviceID  = aDecoder.decodeInteger(forKey: Keys.serviceID)  as  Int
        categoryID = aDecoder.decodeInteger(forKey: Keys.categoryID) as  Int
        desc       = aDecoder.decodeObject(forKey: Keys.desc)        as! String
        title      = aDecoder.decodeObject(forKey: Keys.title)       as! String
        image      = aDecoder.decodeObject(forKey: Keys.image)       as! String
        
    }
    
    //======write to disk======
    func encode(with coder : NSCoder) {
        
        coder.encode(serviceID,  forKey: Keys.serviceID)
        coder.encode(categoryID, forKey: Keys.categoryID)
        coder.encode(desc,       forKey: Keys.desc)
        coder.encode(title,      forKey: Keys.title)
        coder.encode(image,      forKey: Keys.image)
        
    }
    
}
