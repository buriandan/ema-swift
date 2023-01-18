import Foundation
import Combine

class ClassViewModel: ObservableObject {
        
    @Published var state: ScreenState = .loading
    
    private var bag = Set<AnyCancellable>()
    private let repository = ClassRepository()
    
    func getAllStudents() {
        
        repository.getStudents()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    switch(error) {
                    case ErrorModel.decodingExeption(ErrorModel.authorizationException): self?.state = .expired
                    default: self?.state = .error
                    }
                case .finished: return
                }
            }, receiveValue: { [weak self] data in
                self?.state = .loaded(data)
            })
            .store(in: &bag)
        
    }
}
