//
//  Person.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
