import SwiftUI

struct HomeworkStateView: View {
        
    let stateLabel: String
    let stateValue: Int

    var body: some View {
        
        HStack {
            
            Text(stateLabel)
            
            Spacer()
            
            if stateValue > 0 {
                Image(systemName: "checkmark.circle.fill")
                    .checkIcon()
            } else {
                Image(systemName: "clock.fill")
                    .clockIcon()
            }
        }
        .stateText()
        
    }
}
