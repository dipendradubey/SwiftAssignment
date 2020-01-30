//
//  ViewModel.swift
//  SwiftAssignment
//
//  Created by Dipendra Dubey on 29/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import Foundation

struct InfoModel {
    var name = ""
    var desc = ""
    var imgUrl: URL?
    
     init(_ info: InfoList){
        name = info.title ?? ""
        desc = info.description ?? ""
        if let urlString = info.imageHref, let url = URL(string: urlString) {
            imgUrl = url
        }
    }
}
