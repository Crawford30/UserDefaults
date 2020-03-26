//
//  CategoryAndServiceSingleton.swift
//  CollectionViewAlamofire
//
//  Created by JOEL CRAWFORD on 3/23/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

final class CategoryAndServiceSingleton: NSObject {
    
    static let categoryServiceSharedInstance = CategoryAndServiceSingleton()
    
    private override init() { }
    
        var catgoryID: Int?
        var categoryName: String?
        var servicesID: Int?
        var serviceName: String?
        
    
    
}

