//  BlogPost.swift

import Foundation

struct BlogPost: Identifiable, Equatable {
    let id: String
    let title: String

    static let allPosts = [
        BlogPost(id: UUID().uuidString, title: "My first post"),
        BlogPost(id: UUID().uuidString, title: "Here's six reasons why SwiftUI is great"),
        BlogPost(id: UUID().uuidString, title: "Two reasons why I miss UIKit")
    ]
}

