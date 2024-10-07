// Card.swift

import SwiftUI

struct Card<Content, Accessory>: View where Content: View, Accessory: View {
    private let title: String
    private let image: Image?
    private let content: Content
    private let accessory: Accessory?

    /// A Card view that displays a title, an optional image, content, and a custom accessory view
    init(
        title: String,
        image: Image? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder accessory: () -> Accessory
    ) {
        self.image = image
        self.title = title
        self.content = content()
        self.accessory = accessory()
    }

    /// A Card view that displays a title, an optional image, and content.
    init(
        title: String,
        image: Image? = nil,
        @ViewBuilder content: () -> Content
    ) where Accessory == EmptyView {
        self.image = image
        self.title = title
        self.content = content()
        self.accessory = EmptyView()
    }

    /// A Card view that displays a title, an optional image, content and an accessory title.
    init(
        title: String,
        image: Image? = nil,
        accessoryTitle: String,
        @ViewBuilder content: () -> Content
    ) where Accessory == Text {
        self.image = image
        self.title = title
        self.content = content()
        self.accessory = Text(accessoryTitle)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            Divider()
            content
        }
        .padding()
        .background(.background.secondary)
        .cornerRadius(8)
    }

    /// The header view containing the image, title, and accessory
    private var header: some View {
        HStack(spacing: 12) {
            image?
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 44)
                .clipShape(Circle())

            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            accessory?
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            // Card with a Switch accessory
            Card(title: "Card 3", image: Image(.avatar)) {
                Text("This card contains a title, an image, and a custom accessory view")
            } accessory: {
                Toggle("", isOn: .constant(false))
            }

            // Card with a Button accessory
            Card(title: "Card 4", image: Image(.avatar)) {
                Text("This card contains a title and a custom accessory view")
            } accessory: {
                Button("Add post") {
                    print("Add button tapped")
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
            }

            // Card with a Title accessory
            Card(title: "Card 4", image: Image(.avatar)) {
                Text("This card contains a title and a custom accessory view")
            } accessory: {
                Text("Accessory title")
            }

            // Card without an accessory
            Card(title: "Card 4", image: Image(.avatar)) {
                Text("This card contains a title and a custom accessory view")
            }

            // Card with title, image, and a textual accessory
            Card(title: "Card 5", image: Image(.avatar), accessoryTitle: "Accessory title") {
                Text("This card contains a title, an image, and an accessory title")
            }

            // Card with title, image, and a textual accessory
            Card(title: "Card 6", accessoryTitle: "Accessory title") {
                Text("This card contains a title, and an accessory title")
            }

            // Card with only title
            Card(title: "Card 1") {
                Text("This card contains only a title")
            }

            // Card with title and image
            Card(title: "Card 2", image: Image(.avatar)) {
                Text("This card contains a title and an image")
            }
        }
        .padding()
    }
}
