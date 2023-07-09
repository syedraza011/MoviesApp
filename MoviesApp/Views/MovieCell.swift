//
//  MovieCell.swift
//  MovieApp
//
//  Created by Syed Raza on 6/18/23.
//

import SwiftUI
struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .frame(width: 120, height: 150)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.year)
                        .font(.subheadline)
                }
                Spacer()
            }
            
            Text(movie.type)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie.mock)
    }
}
