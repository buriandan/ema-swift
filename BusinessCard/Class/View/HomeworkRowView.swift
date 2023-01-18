import SwiftUI

struct HomeworkRowView: View {
    
    var homeworks: [HomeworkModel]
    
    var body: some View {
        
        HStack {
            
            ForEach(
                homeworks
                    .filter { homework in
                        homework.state != .comingsoon
                    }
                    .sorted(
                        by: {$0.number < $1.number}
                    )

            ) { homework in
                
                Text("\(homework.number)")
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color("TaskNumber"))
                    .scaledToFill()
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(Color(homework.state.backgroundColor))
                    )
                    .padding(.top, -5)
                
            }
            
        }
        
    }
}
