import SwiftUI

struct ContentView: View {
    
    var body: some View{
        NavigationView {
            NavigationLink(destination: ProfileView()) {
                        Text("Tap Me")
                    }
                }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

