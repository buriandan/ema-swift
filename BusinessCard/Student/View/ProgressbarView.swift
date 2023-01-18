import SwiftUI

struct ProgressBarView: View {
    
    @State var skillRating: Int
    
    var body: some View {
        
        HStack {

            ForEach(1...10, id: \.self) { barPoint in
            
                Rectangle()
                .frame(width: 22, height: 22)
                .padding([.leading, .trailing], 2)
                .foregroundColor(barPoint > skillRating ? .gray.opacity(0.3) : Color("ProgressBarFillColor"))
                .padding(-5)
                
            }
            
        }
        .clipShape(
            RoundedRectangle(cornerRadius: 5)
        )
        .padding(.trailing, 15)
    }
}
