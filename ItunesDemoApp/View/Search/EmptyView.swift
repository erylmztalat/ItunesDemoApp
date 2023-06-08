//
//  EmptyView.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import SwiftUI

struct EmptyView: View {
    let imageName: String
    let message: String
    
    init(imageName: String = "music.note", message: String = "Start searching for music...") {
        self.imageName = imageName
        self.message = message
    }
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .font(.system(size: 85))
                .padding(.bottom)
            Text(message)
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
