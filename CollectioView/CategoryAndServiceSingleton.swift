//
//  CategoryAndServiceSingleton.swift
//  CollectionViewAlamofire
//
//  Created by JOEL CRAWFORD on 3/23/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

//class CategoryAndServiceSingleton: NSObject {
//
//    //private init(){} // for access controll
//
//    static let sharedInstance =  CategoryAndServiceSingleton()
//
//
//    var category_ID: Int?
//    var category_Name: String?
//
//    var service_ID: Int?
//    var service_Name: String?
//
//
//
//    }
//

  


final class CategoryAndServiceSingleton: NSObject {
    
    static let categoryServiceSharedInstance = CategoryAndServiceSingleton()
    
    private override init() { }
    
        var catgoryID: Int?
        var categoryName: String?
        var serviceID: Int?
        var serviceName: String?
        
    
    
}

