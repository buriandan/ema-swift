import Foundation
import Combine

class StudentDetailViewModel: ObservableObject {
        
    @Published var state: ScreenState = .loading
    
    private var bag = Set<AnyCancellable>()
    private let repository = StudentRepository()
    
    func getStudentByID(for id: String) {
            
        repository.getStudentsById(for: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    switch(error) {
                    case ErrorModel.decodingExeption(ErrorModel.authorizationException): self.state = .expired
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
