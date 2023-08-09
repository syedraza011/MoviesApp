
//  ContentView.swift
//  MovieApp
//
//  Created by Syed Raza on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
//    let datasource : [Movie] = [Movie.mock]
    @StateObject var viewModel = MoviesViewModel()
    var body: some View {
        NavigationView {
            VStack{
                SearchField
                    .onChange (of: searchText) { newValue in
                        viewModel.getMovies(newValue)
                    }
//                MovieCell(movie: Movie.mock)
                listView()
            .navigationTitle("Movies")
//            .searchable(text: $searchText)
            .onAppear {
//                listView()
                viewModel.getMovies(searchText)
                
            }
//            .onChange(of: searchText) {
//
//            }
        }
    }
        
}
    private  func listView()-> some View{
        List(viewModel.movies){ movie in
            
            NavigationLink {
                Text(movie.title)
            } label: {
                MovieCell(movie : movie)
            }
         
        }
    }
        

private var SearchField: some View {
        TextField("Search for Movie", text: $searchText )
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal, 16)
        
    }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
