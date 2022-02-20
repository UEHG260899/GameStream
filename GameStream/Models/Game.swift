//
//  Game.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import Foundation

struct Games: Codable {
    var games: [Game]
}
struct Game: Codable {
    var title: String
    var studio: String
    var contentRating: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrl: VideoUrl
    var galleryImages: [String]
}

struct VideoUrl: Codable {
    var mobile: String
    var table: String
}
