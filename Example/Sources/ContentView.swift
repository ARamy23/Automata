import SwiftUI
import DSKit
import Keys

struct ContentView: View {
    var currentEnv: String {
    #if DEBUG
        return "Debug"
    #elseif ALPHA
        return "Alpha"
    #elseif BETA
        return "Beta"
    #elseif RELEASE
        return "Release"
    #endif
    }
    
    var body: some View {
        DSVStack(alignment: .center) {
            DSText("Hi there!")
                .dsTextStyle(.title1)
                .dsPadding()
                .dsBackground(.primary)

            DSText("Sentry DSN: \(Keys.Global().sentryDSN)")
            DSText(currentEnv)
            
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
