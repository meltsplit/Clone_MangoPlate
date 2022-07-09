//
//  SearchBookModel.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import Foundation

struct SearchBookModel: Codable{
    
    let documents : [Documents]
    
}

struct Documents : Codable{
    let title: String
    let authors: [String]
    let thumbnail: String
}


