import SwiftUI

struct StudentDetailView: View {
    
    @StateObject private var students = StudentDetailViewModel()
    
    let studentID: String
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                switch(students.state) {
                    
                case .loading:
                    VStack {
                        LoadingView()
                    }
                    .padding(.top, 100)
                    
                case .error:
                    VStack {
                        Text("Data could not be loaded!")
                        Button("Fetch again", action: {
                            students.getStudentByID(for: studentID)
                        })
                        .loginButton()
                    }
                    .padding(.top, 100)
                    
                case .expired:
                    
                    Text("Token expired. Please, sign in again.")
                        .padding(.top, 100)
                    
                case .loaded(let studentData):
                    ForEach(studentData) { student in
                        VStack {
                            HeaderView(image: student.icon192, job: student.title)
                            SkillsView(skills: student.skills ?? [])
                            HomeworksView()
                        }
                    }
                }
            }
            .onAppear {
                students.getStudentByID(for: studentID)
            }
        }
        .background(Color("AppBackground"))
    }
}
