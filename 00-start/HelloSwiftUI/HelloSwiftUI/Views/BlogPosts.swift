// BlogPosts.swift

import SwiftUI

struct BlogPosts: View {
    let blogPosts: [BlogPost]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("To Do...")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background.secondary)
    }
}

#Preview {
    BlogPosts(blogPosts: BlogPost.allPosts)
        .padding()
}
