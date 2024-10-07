// BlogPosts.swift

import SwiftUI

struct BlogPosts: View {
    let blogPosts: [BlogPost]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            Divider()
            posts
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background.secondary)
        .cornerRadius(8)
    }

    /// The header view containing the avatar, title, and add button
    private var header: some View {
        HStack(spacing: 12) {
            Image("avatar")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 44)
                .clipShape(Circle())

            Text("Taas Daamde")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button("Add post") {
                print("Add button tapped")
            }
        }
    }

    /// The posts view containing a vertical stack of posts
    private var posts: some View {
        VStack(alignment: .leading, spacing: 8) {
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
