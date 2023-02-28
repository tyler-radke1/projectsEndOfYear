//
//  User.swift
//  Random User API
//
//  Created by Tyler Radke on 2/27/23.
//

import Foundation


struct User : Codable {
    var gender: String
    var name: String
    var location: String
    var email: String
    var login: String
    var registered: Bool
    var dob: String
    var phone: String
    var cell: String
    var id: Int
    var picture: Data
    var nat: String
    
}
