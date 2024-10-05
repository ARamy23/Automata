import SwiftUI
import DSKit
import Keys

struct ContentView: View {
    var body: some View {
        DSVStack(alignment: .center) {
            DSText("Hi there!")
                .dsTextStyle(.title1)
                .dsPadding()
                .dsBackground(.primary)

            DSText("Sentry DSN: \(Keys.Global().sentryDSN)")
            
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
