import SwiftUI

struct SocialItemView: View {
    
    let iconName: String
    let iconLabel: String

    var body: some View {
        
        VStack {
            
            Button(
                action: {},
                label: {
                    
                    VStack {
                        Image(iconName)
                            .resizable()
                            .socialIcon()
                        
                        Text(iconLabel)
                            .foregroundColor(Color("SocialLabelColor"))
                    }
                }
            )
        }
    }
}
