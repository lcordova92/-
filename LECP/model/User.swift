//
//  User.swift
//  LECP
//
//  Created by Luis Eduardo Cordova Pichardo on 11/01/23.
//

import Foundation

struct User: Codable{
    
    let results: [Results]
    let info: Info
    
    /*enum CodingKeys: String, CodingKey{
        case results = "results"
        case info = "info"
    }*/
    
}

struct Results: Codable{
    let gender: String?
    let name: Name
    let location: Location
    let email: String?
    let login: Login
    let dob: Dob
    let registered: Registered
    let phone: String?
    let cell: String?
    let id: Id
    let picture: Picture
    let nat: String?
    /*enum CodingKeys: String, CodingKey{
        typealias RawValue = String
        case gender = "gender"
        case name = "name"
        case location = "location"
    }*/
}

struct Info: Codable{
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?
}

struct Name: Codable{
    let title: String?
    let first: String?
    let last: String?
}

struct Location: Codable{
    let street: Street
    let city: String?
    let state: String?
    let country: String?
    let postCode: Int?
    let coordinates: Coordinates
    let timezone: TimeZone
    
}

struct Street: Codable{
    let number: Int?
    let name: String?
}

struct Coordinates: Codable{
    let latitude: String?
    let longitude: String?
}

struct TimeZone: Codable{
    let offset: String?
    let description: String?
}

struct Login: Codable{
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
}

struct Dob: Codable{
    let date: String?
    let age: Int?
}

struct Registered: Codable{
    let date: String?
    let age: Int?
}

struct Id: Codable{
    let name: String?
    let value: String?
}

struct Picture: Codable{
    let large: String?
    let medium: String?
    let thumbnail: String?
}

    
