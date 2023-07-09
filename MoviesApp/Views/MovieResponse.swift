//
//  MovieResponse.swift
//  MovieApp
//
//  Created by Syed Raza on 6/18/23.
//

import Foundation
struct MovieResponse: Decodable{
    let Search: [Movie]
    private enum Codingkey: String, CodingKey {
        case search = "Search"
    }
    static let mock = MovieResponse (Search: [Movie.mock])
}
//    Identifiable
//    let id = UUID()
struct Movie: Decodable, Identifiable {
    let id: String
    let title: String
    let type: String
    let poster: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case type = "Type"
        case poster = "Poster"
        case year = "Year"
    }
    static let mock = Movie(id: "", title: "Title", type: "Movie", poster: "https://www.omdbapi.com/?i=tt3896198&apikey=410a0193", year: "1979")
}
