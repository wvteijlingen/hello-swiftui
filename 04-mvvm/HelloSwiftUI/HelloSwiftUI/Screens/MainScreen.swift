// MainScreen.swift

import SwiftUI

struct MainScreen: View {
    // We use `StateObject` here, because the value is initialized directly in the view.
    @StateObject private var viewModel = MainScreenViewModel()

    // If the value would be provided through the initializer of MainScreen, we should use `ObservedObject`.
    // @ObservedObject private var viewModel: MainScreenViewModel

    // If the value would be local to the view, we should use `State`.
    // @State private var blogPosts: [BlogPost] = BlogPost.allPosts

    var body: some View {
        BlogPosts(blogPosts: viewModel.blogPosts, onAddPostTapped: viewModel.onAddPostTapped)
            .padding()
    }
}

#Preview {
    MainScreen()
}

// MARK: - View Model

class MainScreenViewModel: ObservableObject {
    @Published var blogPosts: [BlogPost] = BlogPost.allPosts

    func onAddPostTapped() {
        let newBlogPost = BlogPost(
            id: UUID().uuidString,
            title: "Another blog post just appeared!"
        )

        blogPosts.append(newBlogPost)
    }
}
