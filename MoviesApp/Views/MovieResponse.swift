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
    static let mock = Movie(id: "tt0120338", title: "Titanic", type:"Movie", poster:"https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg", year:"1979")
}
