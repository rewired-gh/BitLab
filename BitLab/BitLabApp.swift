import SlideOverCard
import SwiftUI

@main
struct BitLabApp: App {
  @AppStorage("FirstStart") var alertShouldBeShown = true

  init() {
    #if DEBUG
      if let bundleID = Bundle.main.bundleIdentifier {
        UserDefaults.standard.removePersistentDomain(forName: bundleID)
      }
    #endif
  }

  var body: some Scene {
    WindowGroup {
      TabView {
        ToolExploreView()
          .tabItem {
            Label("Tools", systemImage: "wrench.and.screwdriver.fill")
          }
        LearnExploreView()
          .tabItem {
            Label("Learn", systemImage: "graduationcap")
          }
      }
      .slideOverCard(
        isPresented: $alertShouldBeShown,
        onDismiss: {
          alertShouldBeShown = false
        }
      ) {
        VStack(spacing: 22) {
          Text("Welcome to BitLab")
            .font(.title).bold()
          Text("Discover a suite of convenient tools designed for working with computer number representations here. Plus, it is a great place for learning how computers manipulate the numbers.")
          Text("Author's website: [https://rewired.moe](https://rewired.moe)")
          Button("Continue", action: {
            alertShouldBeShown = false
          }).buttonStyle(SOCEmptyButton())
        }
      }
    }
  }
}
