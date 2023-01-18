import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        VStack {

            ZStack {
                
                Text("Loading")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -25)
                
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 250, height: 3)
                
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(Color.accentColor)
                    .frame(width: 30, height: 5)
                    .offset(x: isLoading ? 110 : -110, y: 0)
                    .animation(
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            }
            .onAppear() {
                self.isLoading = true
                self.animationAmount = 1.5
            }
            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
