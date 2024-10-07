// BlogPosts.swift

import SwiftUI

struct BlogPosts: View {
    let blogPosts: [BlogPost]
    let onAddPostTapped: () -> Void

    var body: some View {
        Card(title: "Taas Daamde", image: Image(.avatar)) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(blogPosts) { post in
                    Text(post.title)
                        .frame(height: 32)
                        .transition(MoveTransition(edge: .leading))
                }
            }
        } accessory: {
            Button("Add post", action: onAddPostTapped)
                .foregroundStyle(.blue)
        }.animation(.easeInOut, value: blogPosts)
    }
}

#Preview {
    BlogPosts(blogPosts: BlogPost.allPosts, onAddPostTapped: {})
        .padding()
}
