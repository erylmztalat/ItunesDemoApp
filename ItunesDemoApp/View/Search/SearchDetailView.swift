//
//  SearchDetailView.swift
//  ItunesDemoApp
//
//  Created by talate on 9.06.2023.
//

import SwiftUI

struct SearchDetailView: View {
    @ObservedObject var songViewModel: SongViewModel
    let dateFormatter = DateFormatterService()
    
    var body: some View {
        VStack {
            if let imageData = songViewModel.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipped()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                Text("Artist: \(songViewModel.song.artistName)")
                    .font(.system(size: 16))
                Text("Title: \(songViewModel.song.trackName)")
                    .font(.system(size: 23, weight: .bold))
                Text("Album: \(songViewModel.song.collectionName)")
                    .font(.system(size: 16))
                Text("Release Date: \(dateFormatter.convert(dateString: songViewModel.song.releaseDate) ?? "")")
                    .font(.system(size: 16))
                Text("Genre: \(songViewModel.song.primaryGenreName)")
                    .font(.system(size: 16))
            }
            .padding()

            Spacer()
        }
        .navigationBarItems(trailing: createLink())
        .onAppear {
            songViewModel.loadImage(for: .large)
        }
    }
    
    @ViewBuilder
    private func createLink() -> some View {
        if let url = URL(string: songViewModel.song.trackViewUrl) {
            Link(destination: url) {
                Image(systemName: "safari")
            }
        } else {
            EmptyView()
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let song = Song(trackName: "Understand Please Understand", artistName: "Book Club", collectionName: "Shapes on the Water EP", artworkUrl60: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/98/43/07/98430737-5d94-2459-9677-0d4efef91c5e/artwork.jpg/60x60bb.jpg", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/98/43/07/98430737-5d94-2459-9677-0d4efef91c5e/artwork.jpg/100x100bb.jpg", trackViewUrl: "https://music.apple.com/de/album/bad-memories/1582391215?i=1582391216&uo=4", releaseDate: "2021-09-24T12:00:00Z", primaryGenreName: "Alternative")
        let viewModel = SongViewModel(song: song, imageLoader: URLImageLoader())
        SearchDetailView(songViewModel: viewModel)
    }
}
