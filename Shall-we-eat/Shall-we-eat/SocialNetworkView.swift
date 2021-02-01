//
//  SocialNetwork.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI
import AVKit


struct SocialNetworkView: View {
    @State private var changeView: Bool = false
    @State private var videos = Post.DataVideo
   // @State private var login = Author.AllAcount
    
    var body: some View {
        NavigationView {
            ZStack() {
                PlayerScrollView(DataVideo: $videos)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 25){
                    Button (action:{
                        self.changeView = true
                    }) {
                    }
                    NavigationLink(
                        destination: SocialNetwork1(),
                        isActive: self.$changeView,
                        label: {
                            Image("onion")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        })
                    Button(action:{
                        
                    }) {
                        Image(systemName: "suit.heart")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }
                    Button(action:{
                        
                    }) {
                        Image(systemName: "message")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Button(action:{
                        
                    }) {
                        Image(systemName: "arrowshape.turn.up.right")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Button(action:{
                        
                    }) {
                        Image(systemName: "newspaper")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }.padding(.bottom, 50)
                .padding(.trailing)
                .position(x: 360.0, y: 150.0)
                
            }.navigationBarHidden(true)
        }
    }
}

struct PlayerView: View {
    @Binding var DataVideo: [Post]
    
    var body: some View {
        VStack (spacing: 0){
            ForEach(self.DataVideo){i in
                Player(videoURL: i.video)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)//full screensize
                    .offset(y: -5)
                
            }
        }
        .onAppear{
            
        }
    }
    
}

struct Player: UIViewControllerRepresentable {
    let videoURL: URL
    let player: AVPlayer
    
    init(videoURL: URL) {
        self.videoURL = videoURL
        self.player = AVPlayer(url: videoURL)
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController{
        
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}
struct PlayerScrollView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @Binding var DataVideo: [Post]
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(DataVideo: self.$DataVideo))
        
        childView.view.frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((DataVideo.count)))//full screen
        
        view.contentSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((DataVideo.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        uiView.contentSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((DataVideo.count)))
        
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((DataVideo.count)))
        }
    }
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent: PlayerScrollView
        var index = 0
        
        init(parent1: PlayerScrollView){
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currnerindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            /*
            if index != currnerindex{
                index = currnerindex
                for i in 0..<parent.DataVideo.count{
                    
                    parent.DataVideo[i].player.seek(to: .zero)//pause for all video
                    parent.DataVideo[i].player.pause()
                    
                }
                parent.DataVideo[index].player.play() //play next video
            }
             */
        }
    }
}

struct SocialNetwork_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkView()
    }
}
