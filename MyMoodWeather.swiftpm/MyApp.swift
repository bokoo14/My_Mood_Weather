import SwiftUI

@main
struct MyApp: App {
    init() {
        CustomFont.registerFonts(fontName: "KCC-Chassam")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
