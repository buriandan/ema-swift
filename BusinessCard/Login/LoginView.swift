import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    TextField("Username", text: $viewModel.username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $viewModel.password)
                }
                .textFieldStyle(.roundedBorder)
                
                if viewModel.signWait {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding(.top, 20)
                } else {
                    Button("Sign In") {
                        viewModel.login(for: viewModel.username, for: viewModel.password)
                    }
                    .loginButton()
                }
                
                Spacer()
        
            }
            .padding()
            .navigationTitle("Sign In")
            .alert(isPresented: $viewModel.hasError) {
                return Alert(
                    title: Text("Přihlášení se nepovedlo."),
                    message: Text("Zkontrolujte zadané údaje!")
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            viewModel.showModal = false
                        },
                        label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                    )
                }
            }
            
        }
        .padding()
        
    }
}
