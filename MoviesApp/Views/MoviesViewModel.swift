//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Syed Raza on 6/18/23.
//

import Foundation
import Combine
import SwiftUI

protocol MovieServiceProtocol {
    
    
}
class MoviesViewModel: ObservableObject{
    
    @Published var movies = [Movie]()
//    Future<[Movie], Error>
    var cancelable = Set<AnyCancellable>()
    
    let service = MovieService()
//    let service : MovieServiceProtocol
//    init (service: MovieServiceProtocol = MovieService())
//    {
//        self.service = service
//    }
    
    func getMovies (_ search: String){
      service.fetchMovies(search)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure ( let err):
                    print(err.localizedDescription)
                }
            } receiveValue: {  movies in // leaing memory
                    self.movies = movies
                }
                .store(in: &cancelable)
            }
    }

func testFetchMvies(){
    
}
