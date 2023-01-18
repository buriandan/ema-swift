import SwiftUI

struct SkillsView: View {
    
    var skills: [SkillModel]
    
    var body: some View {
        
        VStack(alignment: .leading) {

            HStack {

                Text("Skills")
                    .font(.system(size: 32, weight: .medium))

                Spacer()

            }

            VStack(alignment: .leading) {
                
                ForEach(skills) { skill in
                    
                    SkillItemView(
                        iconName: skill.skillType,
                        skillRating: skill.value
                    )
                
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
