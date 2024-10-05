import SwiftUI
import DSKit

struct ContentView: View {
    var body: some View {
        DSVStack(alignment: .center) {
            DSText("Hi there!")
                .dsTextStyle(.title1)
                .dsPadding()
                .dsBackground(.primary)

            DSButton(
                title: "Automate",
                action: { print("Do something") }
            )
        }
        .dsScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
