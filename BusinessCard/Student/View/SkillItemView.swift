import SwiftUI

struct SkillItemView: View {
    
    let iconName: String
    let skillRating: Int
    
    var body: some View {
    
        HStack {
            
            Image(iconName)
                .resizable()
                .skillIcon()
            
            Spacer()
            
            ProgressBarView(skillRating: skillRating)
        
        }
        
    }
    
}
