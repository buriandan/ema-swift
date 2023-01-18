import SwiftUI
import Foundation

struct ClassView: View {
    
    @StateObject private var students = ClassViewModel()
    
    @State private var selectedPlatform: PlatformType? = nil
    private var classList: [StudentModel] = []
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Picker("", selection: $selectedPlatform) {
                    Text("All").tag(nil as PlatformType?)
                    ForEach(PlatformType.allCases, id: \.rawValue) { type in
                        Text(type.pickerLabel).tag(type as PlatformType?)
                    }
                }
                .pickerStyle(.segmented)
                
                switch(students.state) {
                    
                case .loading:
                    Spacer()
                    LoadingView()
                    Spacer()
                    
                case .error:
                    Spacer()
                    VStack {
                        Text("Data could not be loaded!")
                        Button("Fetch again", action: {
                            students.getAllStudents()
                        })
                        .loginButton()
                    }
                    Spacer()
                    
                case .expired:
                    
                    Spacer()
                    Text("Token expired. Please, sign in again.")
                    Spacer()
                    
                case .loaded(let classData):
                    List {
                        ForEach(selectedPlatform != nil ? classData.filter { $0.participantType == selectedPlatform?.rawValue } : classData) { student in
                            NavigationLink(
                                destination: StudentDetailView(studentID: student.id)
                                    .navigationTitle(student.name)
                                    .navigationBarTitleDisplayMode(.large)) {
                                        LazyVStack(alignment: .leading, spacing: 20) {
                                            StudentRowView(studentData: student)
                                        }
                                    }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .padding(-15)
                    .listStyle(PlainListStyle())
                    .padding(.top, 20)
                }
                
            }
            .padding()
            .navigationTitle("Students")
        }
        .onAppear {
            students.getAllStudents()
        }
    }
}
