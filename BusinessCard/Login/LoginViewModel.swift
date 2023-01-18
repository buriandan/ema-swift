import SwiftUI
import Combine
import Foundation

final class LoginViewModel: ObservableObject {
    
    var repository = LoginRepository()
    let defaults = UserDefaults.standard

    @Binding var showModal: Bool
    @Binding var signWait: Bool
    @Binding var isSignedIn: Bool
    @Binding var hasError: Bool
    
    @Published var username = ""
    @Published var password = ""
    
    private var bag = Set<AnyCancellable>()
    
    init(
        showModal: Binding<Bool>,
        signWait: Binding<Bool>,
        isSignedIn: Binding<Bool>,
        hasError: Binding<Bool>
    ) {
        self._showModal = showModal
        self._signWait = signWait
        self._isSignedIn = isSignedIn
        self._hasError = hasError
    }

    func login(for username: String, for password: String) {
        
        self.signWait = true
        
        repository.loginUser(for: username, for: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure: self?.hasError = true; self?.signWait = false
                case .finished: return
                }
            }, receiveValue: { [weak self] data in
                self?.defaults.set(data.access_token, forKey: "cz.buriandan.businessCard.access_token")
                self?.defaults.set(data.expiration, forKey: "cz.buriandan.businessCard.expiration")
                self?.defaults.set(username, forKey: "cz.buriandan.businessCard.username")
                self?.defaults.set(password, forKey: "cz.buriandan.businessCard.password")
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    self?.isSignedIn = true
                    self?.signWait = false
                    self?.showModal = false
                }
            })
            .store(in: &bag)
    
    }
}
