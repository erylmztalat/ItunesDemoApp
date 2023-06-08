//
//  SearchDetailView.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var searchListViewModel: SearchListViewModel

    var body: some View {
        HStack {
            if let imageData = searchListViewModel.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                Text(searchListViewModel.song.artistName)
                    .lineLimit(1)
                    .font(.system(size: 14))
                Text(searchListViewModel.song.trackName)
                    .lineLimit(1)
                    .font(.system(size: 20, weight: .bold))
                Text(searchListViewModel.song.collectionName)
                    .lineLimit(1)
                    .font(.system(size: 14, weight: .semibold))
            }
            Spacer()
        }
        .onAppear {
            searchListViewModel.loadImage()
        }
        .shadow(radius: 1)
    }
}




struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        let song = Song(trackName: "Understand Please Understand", artistName: "Book Club", collectionName: "Shapes on the Water EP", artworkUrl60: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/98/43/07/98430737-5d94-2459-9677-0d4efef91c5e/artwork.jpg/60x60bb.jpg", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/98/43/07/98430737-5d94-2459-9677-0d4efef91c5e/artwork.jpg/100x100bb.jpg", trackViewUrl: "https://music.apple.com/de/album/bad-memories/1582391215?i=1582391216&uo=4", releaseDate: "2021-09-24T12:00:00Z", primaryGenreName: "Alternative")
        let viewModel = SearchListViewModel(song: song, imageLoader: URLImageLoader())
        SearchListView(searchListViewModel: viewModel)
    }
}
