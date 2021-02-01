//
//  VideoPlayerView.swift
//  Shall-we-eat
//
//  Created by Halyna on 19/01/2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    
    var videoURL: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController{
        
        let controller = AVPlayerViewController()
        controller.player = AVPlayer(url: videoURL)
        controller.videoGravity = .resizeAspectFill
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}
