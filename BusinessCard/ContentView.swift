import SwiftUI

struct ContentView: View {
    
    let defaults = UserDefaults.standard

    var body: some View {

        TabView {

            ClassView()
                .tabItem {
                    Label("Students", systemImage: "graduationcap.circle.fill")
                }

            UserView(viewModel: UserViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }

        }
    
    }

}
