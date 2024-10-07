// Card.swift

import SwiftUI

struct Card<Content>: View where Content: View {
    private let title: String
    private let image: Image?
    private let content: Content

    /// A Card view that displays a title, an optional image, and content.
    init(
        title: String,
        image: Image? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.image = image
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            Divider()
            content
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background.secondary)
        .cornerRadius(8)
    }

    /// The header view containing the image and title
    private var header: some View {
        HStack(spacing: 12) {
            image?
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
}

#Preview {
    // Card with only title
    Card(title: "Card 1") {
        Text("This card contains only a title")
    }
    .padding()

    // Card with title and image
    Card(title: "Card 2", image: Image(.avatar)) {
        Text("This card contains a title and an image")
    }
    .padding()
}
