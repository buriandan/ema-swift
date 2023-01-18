import SwiftUI
import Combine
import Foundation

class UserSkillViewModel: ObservableObject {
        
    @Published var skills: [SkillModel]
    var repository = UserRepository()
    private var bag = Set<AnyCancellable>()
    @Binding var hasError: Bool
    
    init(
        skills: [SkillModel],
        hasError: Binding<Bool>
    ) {
        self.skills = skills
        self._hasError = hasError
    }
    
    func saveSkills() {
        
        repository.updateSkills(for: skills)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure: self?.hasError = true
                case .finished: return
                }
            }, receiveValue: { [weak self] data in
                self?.skills = data
            })
            .store(in: &bag)
    
    }
}
