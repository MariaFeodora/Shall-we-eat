//
//  Post.swift
//  test2
//
//  Created by Halyna on 19/01/2021.
//

import SwiftUI
import AVKit

struct Post: Identifiable {
    
var id = UUID()
let author: Author
let FhotoAuthor: Author
var player: AVPlayer
var replay: Bool


static var DataVideo = [
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
}
