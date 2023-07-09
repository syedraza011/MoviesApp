//
//  MovieService.swift
//  MovieApp
//
//  Created by Syed Raza on 6/18/23.
//
import SwiftUI
import Foundation
import Combine

class MovieService {
    var cancelable = Set<AnyCancellable>()
    let urlString = "https://www.omdbapi.com/?i=tt3896198&apikey=e91f163f&s="
    //ToDO fix memory leak
//http://www.omdbapi.com/?i=tt3896198&apikey=410a0193&s=titanic
//    protocol MovieServiceProtocol {
//        func fetchMovies( _ searchtext:String)->Future<[Movie], Error>
//    }
//
    func fetchMovies (_ searchText: String) -> Future<[Movie], Error> {
        return Future { [weak self] promise in
            guard let self = self else{return}
            let finalString = self.urlString + searchText // leaking memory here
            guard let url = URL(string: finalString) else {return}
            //it would make a call and publish the response for data
            URLSession.shared.dataTaskPublisher(for: url)
            //now do something with response
            //apply operaters on response which we got from publisher
                .map { $0.data} //rawdata here  $0 means give us all data
                .decode(type: MovieResponse.self, decoder: JSONDecoder())
            
                .receive(on: RunLoop.main) // recieving on main thread
                
                // now sink
            // this publisher is giving us response, listening to the event
            //
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise (.failure(err))
                    }
                } receiveValue: { response in
                    //if sucess then send back
                    promise(.success(response.Search))
//                    promise(.success(response.search))
                    
                }
                // we wana store data until we are not done with fetch, update and perform other operations
                .store(in: &self.cancelable)
        }
    }
    
}
