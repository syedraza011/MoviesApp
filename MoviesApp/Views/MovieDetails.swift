//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Syed Raza on 7/9/23.
//

import SwiftUI
import SwiftUI

struct MovieDetails: View {
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .frame(width: 320, height: 450)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                }
            }
            HStack{
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.year)
                        .font(.subheadline)
                    Text("Genre:\(movie.type)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                

        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        MovieDetails(movie: Movie(id: "tt0120338", title: "Titanic", type:"Movie", poster:"https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg", year:"1979"))
    }
}


