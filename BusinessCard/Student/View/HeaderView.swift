import SwiftUI

struct HeaderView: View {
    
    var image: String
    var job: String
    
    var body: some View {
        
        VStack(alignment: .center) {
        
            AsyncImage(
                url: URL(string: image),
                content: { image in
                    image.resizable()
                       
                },
                placeholder: {
                    Circle()
                        .background(Color.gray)
                        .foregroundColor(Color.gray)
                        .clipShape(Circle())
                })
            .frame(width: 150, height: 150)
            .scaledToFit()
            .clipShape(Circle())
            .padding(.top, 15)
    
            Text(job)
                .font(.system(size: 16, weight: .light))
                .foregroundColor(.gray)
                .opacity(0.8)
                .padding(.top, 15)
            
            HStack {
                
                Spacer()
                
                SocialItemView(
                    iconName: "slack",
                    iconLabel: "Slack"
                )
                
                Spacer()
                
                SocialItemView(
                    iconName: "email",
                    iconLabel: "E-mail"
                )
                
                Spacer()
                
                SocialItemView(
                    iconName: "linkedin",
                    iconLabel: "Linkedin"
                )
            
                Spacer()
                
            }
            .padding(.bottom, 20)
            
            Divider()
                .overlay(Color("DividerFillColor"))
            
        }
        .sectionPadding()
        
    }
}
