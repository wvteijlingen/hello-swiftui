// BlogPosts.swift

import SwiftUI

struct BlogPosts: View {
    let blogPosts: [BlogPost]

    var body: some View {
        Card(title: "Taas Daamde", image: Image(.avatar)) {
            ForEach(blogPosts) { post in
                Text(post.title)
                    .frame(height: 32)
            }
        } accessory: {
            Button("Add post") {
                print("Add button tapped")
            }.foregroundStyle(.blue)
        }
    }
}

#Preview {
    BlogPosts(blogPosts: BlogPost.allPosts)
        .padding()
}
