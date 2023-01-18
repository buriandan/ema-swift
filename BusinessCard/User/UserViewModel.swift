import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    
    let defaults = UserDefaults.standard
    
    @Published var isSignedIn: Bool = false
    @Published var signWait: Bool = false
    @Published var showModal: Bool = false
    @Published var hasError: Bool = false
    
    @Published var state: ScreenState = .loading
    
    private var bag = Set<AnyCancellable>()
    private let repository = UserRepository()
    
    init() {
        if defaults.string(forKey: "cz.buriandan.businessCard.access_token") != nil {
            self.isSignedIn = true
        }
    }
    
    func getProfileById(for id: String) {
        
        repository.getProfileById(for: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    switch(error) {
                    case ErrorModel.decodingExeption(ErrorModel.authorizationException): self.isSignedIn = false
                    default: self.state = .error
                    }
                case .finished: return
                }
            }, receiveValue: { data in
                self.state = .loaded([data])
            })
            .store(in: &bag)
        
    }
    
}
