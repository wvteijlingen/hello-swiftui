//  ContentView.swift

import SwiftUI

struct MainScreen: View {
    private let blogPosts = BlogPost.allPosts

    var body: some View {
        BlogPosts(blogPosts: blogPosts)
            .padding()
    }
}

#Preview {
    MainScreen()
}
