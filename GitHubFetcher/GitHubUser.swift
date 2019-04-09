//
//  GitHubUser.swift
//  GitHubFetcher
//
//  Created by Spock on 2019/4/7.
//  Copyright © 2019 Spock. All rights reserved.
//

import Foundation

public struct GitHubUser: Codable {
    public let name: String
    public let location: String
    public let repos: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case location
        case repos = "public_repos"
    }
}

public struct GitHubFollower: Codable {
    public let login: String
    
    private enum CodingKeys: String, CodingKey {
        case login
    }
}
