//
//  Account.swift
//  Shall-we-eat
//
//  Created by Halyna on 14/01/2021.
//

import SwiftUI

struct Account:View {
    let columns = [
            GridItem(),
            GridItem()
        ]
    @State private var Accountvideo = Post.DataVideo
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    VStack {
                        Image(Author.AllAcount[0].AccountPhoto)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text ("my account")
                    }
                    
                    Image(systemName: "suit.heart")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    Image(systemName: "message")
                        .font(.title)
                        .foregroundColor(.black)
                    Image(systemName: "message")
                        .font(.title)
                        .foregroundColor(.black)
                }
            LazyVGrid(columns: columns, content: {
                ForEach(Accountvideo){video in
                    VideoPlayerView (player: video.player)
                        .cornerRadius(15)
                        .frame(height: 300)
                }
            })
           
}
}
}
}
struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
