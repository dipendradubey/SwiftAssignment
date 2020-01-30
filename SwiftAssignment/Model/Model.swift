//
//  Model.swift
//  SwiftAssignment
//
//  Created by Dipendra Dubey on 29/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import Foundation

struct Info: Codable{
    let title: String
    let rows: [InfoList]
}

struct InfoList: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
