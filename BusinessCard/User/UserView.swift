import SwiftUI
import Combine

struct UserView: View {
    
    @StateObject var viewModel: UserViewModel
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if !viewModel.isSignedIn {
                    
                    Button("Sign In", action: {
                        viewModel.showModal.toggle()
                    })
                    .loginButton()
                    
                } else {
                    
                    ScrollView {
                        VStack {
                            
                            switch(viewModel.state) {
                                
                            case .loading:
                                VStack {
                                    LoadingView()
                                }
                                .padding(.top, 100)
                                
                            case .error:
                                VStack {
                                    Text("Data could not be loaded!")
                                    Button("Fetch again", action: {
                                        viewModel.getProfileById(for: defaults.string(forKey: "cz.buriandan.businessCard.username")!)
                                    })
                                    .loginButton()
                                }
                                .padding(.top, 100)
                                
                            case .expired:
                                
                                Text("")
                                
                            case .loaded(let userData):
                                ForEach(userData) { user in
                                    VStack {
                                        VStack(alignment: .center) {
                                            
                                            AsyncImage(
                                                url: URL(string: user.icon192),
                                                content: { image in
                                                    image.resizable()
                                                    
                                                },
                                                placeholder: {
                                                    Circle()
                                                        .background(Color.gray)
                                                        .foregroundColor(Color.gray)
                                                        .clipShape(Circle())
                                                })
                                            .frame(width: 150, height: 150)
                                            .scaledToFit()
                                            .clipShape(Circle())
                                            .padding(.top, 15)
                                            
                                            Text(user.title)
                                                .font(.system(size: 16, weight: .light))
                                                .foregroundColor(.gray)
                                                .opacity(0.8)
                                                .padding(.top, 15)
                                            
                                            HStack {
                                                
                                                Spacer()
                                                
                                                SocialItemView(
                                                    iconName: "slack",
                                                    iconLabel: "Slack"
                                                )
                                                
                                                Spacer()
                                                
                                                SocialItemView(
                                                    iconName: "email",
                                                    iconLabel: "E-mail"
                                                )
                                                
                                                Spacer()
                                                
                                                SocialItemView(
                                                    iconName: "linkedin",
                                                    iconLabel: "Linkedin"
                                                )
                                                
                                                Spacer()
                                                
                                            }
                                            .padding(.bottom, 20)
                                            Divider()
                                                .overlay(Color("DividerFillColor"))
                                            
                                        }
                                        .sectionPadding()
                                        
                                        UserSkillsView(user: user, viewModel: UserSkillViewModel(skills: user.skills ?? [], hasError: $viewModel.hasError))
                                        
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Homeworks")
                                                    .font(.system(size: 32, weight: .medium))
                                                Spacer()
                                            }
                                            
                                            ScrollView(.horizontal, showsIndicators: false) {
                                                HStack(spacing: 30) {
                                                    HomeworkItem(
                                                        homeWorkNumber: 1,
                                                        pushedState: 1,
                                                        reviwedState: 1,
                                                        acceptedState: 1
                                                    )
                                                    HomeworkItem(
                                                        homeWorkNumber: 2,
                                                        pushedState: 0,
                                                        reviwedState: 0,
                                                        acceptedState: 0
                                                    )
                                                    HomeworkItem(
                                                        homeWorkNumber: 3,
                                                        pushedState: 0,
                                                        reviwedState: 0,
                                                        acceptedState: 0
                                                    )
                                                    HomeworkItem(
                                                        homeWorkNumber: 4,
                                                        pushedState: 0,
                                                        reviwedState: 0,
                                                        acceptedState: 0
                                                    )
                                                    HomeworkItem(
                                                        homeWorkNumber: 5,
                                                        pushedState: 0,
                                                        reviwedState: 0,
                                                        acceptedState: 0
                                                    )
                                                    HomeworkItem(
                                                        homeWorkNumber: 6,
                                                        pushedState: 0,
                                                        reviwedState: 0,
                                                        acceptedState: 0
                                                    )
                                                }
                                            }
                                        }
                                        .sectionPadding()
                                    }
                                }
                            }
                        }
                        .onAppear {
                            viewModel.getProfileById(for: defaults.string(forKey: "cz.buriandan.businessCard.username") ?? "")
                        }
                    }
                }
                
            }
            .navigationTitle("Profile")
            .background(Color("AppBackground"))
            .alert(isPresented: $viewModel.hasError) {
                Alert(
                    title: Text("Uložení se nepovedlo."),
                    message: Text("Zkuste akci znovu!")
                )
            }
            .sheet(isPresented: $viewModel.showModal) {
                LoginView(
                    viewModel: LoginViewModel(
                        showModal: $viewModel.showModal,
                        signWait: $viewModel.signWait,
                        isSignedIn: $viewModel.isSignedIn,
                        hasError: $viewModel.hasError
                    )
                )
            }
        }
    }
}
