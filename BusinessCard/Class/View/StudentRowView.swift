import SwiftUI

struct StudentRowView: View {
        
    var studentData: StudentModel
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0) {
        
            AsyncImage(
                url: URL(string: studentData.icon192),
                content: { image in
                    image.resizable()
                        .profilePhoto()
                },
                placeholder: {
                    Circle()
                        .background(Color.gray)
                        .foregroundColor(Color.gray)
                        .clipShape(Circle())
                })
            .frame(width: 80, height: 80)
 
            Image("\(studentData.participantType)-badge")
                .resizable()
                .profileBadge()

            VStack(alignment: .leading) {
                
                Text(studentData.name)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color("ProfileName"))
                
                HomeworkRowView(homeworks: studentData.homework)
                
            }
            .padding(.leading, 20)
        
            Spacer()
            
        }
    }
}
