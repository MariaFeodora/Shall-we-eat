//
//  SocialNetwork.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI
import AVKit


struct SocialNetworkView: View {
    @State var DataVideo = [
        Post(author: Author.AllAcount[0], FhotoAuthor: Author.AllAcount[0], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7408", ofType: "MOV")!)), replay: false),
        Post(author: Author.AllAcount[0], FhotoAuthor: Author.AllAcount[0], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_IMG_7187", ofType: "MOV")!)), replay: false),
        Post(author: Author.AllAcount[0], FhotoAuthor: Author.AllAcount[0], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7487", ofType: "MOV")!)), replay: false),
        Post(author: Author.AllAcount[0], FhotoAuthor: Author.AllAcount[0], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7487", ofType: "MOV")!)), replay: false),
        
        Post(author: Author.AllAcount[1], FhotoAuthor: Author.AllAcount[1], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_3903", ofType: "MOV")!)), replay: false),
        Post(author: Author.AllAcount[1], FhotoAuthor: Author.AllAcount[1], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_4209", ofType: "MOV")!)), replay: false),
        
        Post(author: Author.AllAcount[2], FhotoAuthor: Author.AllAcount[2], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_4188", ofType: "MOV")!)), replay: false),
        Post(author: Author.AllAcount[2], FhotoAuthor: Author.AllAcount[2], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7363", ofType: "MOV")!)), replay: false),
     
        Post(author: Author.AllAcount[3], FhotoAuthor: Author.AllAcount[3], player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_3904", ofType: "MOV")!)), replay: false),
    ]
    @State private var changeView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack() {
                PlayerScrollView(DataVideo: self.$DataVideo)
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
                Player(player: i.player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)//full screensize
                    .offset(y: -5)
                
            }
        }
        .onAppear{
            self.DataVideo[0].player.play()
        }
    }
    
}

struct Player: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
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
            
            if index != currnerindex{
                index = currnerindex
                for i in 0..<parent.DataVideo.count{
                    
                    parent.DataVideo[i].player.seek(to: .zero)//pause for all video
                    parent.DataVideo[i].player.pause()
                    
                }
                parent.DataVideo[index].player.play() //play next video
            }
        }
    }
}

struct SocialNetwork_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkView()
    }
}
/*import SwiftUI
import AVKit


struct SocialNetworkView: View {
    @State var DataVideo = [
        Video(id: 0, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7363", ofType: "MOV")!)), replay: false),
        Video(id: 1, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7408", ofType: "MOV")!)), replay: false),
        Video(id: 2, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7847", ofType: "MOV")!)), replay: false)
    ]
    @State private var changeView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack() {
                PlayerScrollView(DataVideo: self.$DataVideo)
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
    @Binding var DataVideo: [Video]
    
    var body: some View {
        VStack (spacing: 0){
            
            ForEach(self.DataVideo){i in
                Player(player: i.player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)//full screensize
                    .offset(y: -5)
                
            }
        }
        .onAppear{
            self.DataVideo[0].player.play()
        }
    }
    
}

struct Player: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
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
/*class Host:UIHostingController <SocialNetwork>{
 override var Status: UIStatusBarStyle{
 return .lightContent
 }
 }*/

struct Video: Identifiable {
    
    var id: Int
    var player: AVPlayer
    var replay: Bool
}

struct PlayerScrollView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @Binding var DataVideo: [Video]
    
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
            
            if index != currnerindex{
                index = currnerindex
                for i in 0..<parent.DataVideo.count{
                    
                    parent.DataVideo[i].player.seek(to: .zero)//pause for all video
                    parent.DataVideo[i].player.pause()
                    
                }
                parent.DataVideo[index].player.play() //play next video
            }
        }
    }
}

struct SocialNetwork_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkView()
    }
}*/
