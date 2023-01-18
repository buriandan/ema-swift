import SwiftUI

struct HomeworkItem: View {
    
    let homeWorkNumber: Int
    let pushedState: Int
    let reviwedState: Int
    let acceptedState: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("\(homeWorkNumber)")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color("HomeworkNumberBackground"))
                )
            
            Spacer()
            
            HomeworkStateView(stateLabel: "PUSHED", stateValue: pushedState)
            
            Spacer()
                .frame(height: 8)
            
            HomeworkStateView(stateLabel: "REVIEWED", stateValue: reviwedState)
            
            Spacer()
                .frame(height: 8)
            
            HomeworkStateView(stateLabel: "ACCEPTED", stateValue: acceptedState)

        }
        .frame(width: 200, height: 200)
        .padding(.all, 20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("SkillStackBackground"))
        )
        
    }
}
