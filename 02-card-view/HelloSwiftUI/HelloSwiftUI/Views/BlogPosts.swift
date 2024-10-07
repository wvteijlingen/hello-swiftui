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
        }
    }
}

#Preview {
    BlogPosts(blogPosts: BlogPost.allPosts)
        .padding()
}
