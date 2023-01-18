import SwiftUI

struct UserSkillsView: View {
    
    let user: StudentModel
    @State private var editMode: Bool = false
    @ObservedObject var viewModel: UserSkillViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Skills")
                    .font(.system(size: 32, weight: .medium))
                Spacer()
                
                if !editMode {
                    
                    Button(
                        action: {
                            self.editMode = true
                        },
                        label: {
                            Image(systemName: "square.and.pencil")
                            Text("Edit")
                        }
                    )
                    .smallButton()
                    
                } else {
                    
                    Button(
                        action: {
                            self.editMode = false
                            viewModel.saveSkills()
                        },
                        label: {
                            Image(systemName: "checkmark.circle")
                            Text("Save")
                        }
                    )
                    .smallButton()
                }
            }
            
            VStack(alignment: .trailing) {
                
                ForEach($viewModel.skills) { skill in
                    
                    if editMode == true {
                        HStack(alignment: .center) {
                            Spacer()
                            Stepper("", value: skill.value, in: 0...10)
                                .labelsHidden()
                                .padding(.bottom, -15)
                        }
                    }
                    
                    HStack {
                        Image(skill.wrappedValue.skillType)
                            .resizable()
                            .skillIcon()
                        Spacer()
                        ProgressBarView(skillRating: skill.wrappedValue.value)
                    }
                }
            }
            .padding(.all, 15)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("SkillStackBackground"))
            )
        }
        .sectionPadding()
    }
}
