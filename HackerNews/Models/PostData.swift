//
//  PostData.swift
//  HackerNews
//
//  Created by Charlie G on 2022/1/8.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID:String 
    let points: Int
    let title: String
    let url: String?
}
