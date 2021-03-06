//
//  Post.swift
//  test2
//
//  Created by Halyna on 19/01/2021.
//

import SwiftUI
import AVKit

struct Post: Identifiable {
    
    var id = UUID().uuidString
    let author: Author
    var video : URL
    var replay: Bool

    static var DataVideo = [
        Post(author: Author.AllAcount[0],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7408", ofType: "MOV")!),
             replay: false),
        Post(author: Author.AllAcount[0],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7187", ofType: "MOV")!),
             replay: false),
        Post(author: Author.AllAcount[0],
             video:  URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7847", ofType: "MOV")!),
             replay: false),
        Post(author: Author.AllAcount[0],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_3840", ofType: "MOV")!),
             replay: false),
        
        Post(author: Author.AllAcount[1],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_3903", ofType: "MOV")!),
             replay: false),
        Post(author: Author.AllAcount[1],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_4209", ofType: "MOV")!),
             replay: false),
        
        Post(author: Author.AllAcount[2],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_4188", ofType: "MOV")!),
        replay: false),
        Post(author: Author.AllAcount[2],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_7363", ofType: "MOV")!),
             replay: false),
        
        Post(author: Author.AllAcount[3],
             video: URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_3904", ofType: "MOV")!),
             replay: false)
    ]
}
