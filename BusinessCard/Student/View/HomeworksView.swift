import SwiftUI

struct HomeworksView: View {
    var body: some View {
        
        VStack(alignment: .leading) {

            HStack {

                Text("Homeworks")
                    .font(.system(size: 32, weight: .medium))

                Spacer()

            }

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 30) {

                    HomeworkItem(
                          homeWorkNumber: 1,
                          pushedState: 1,
                          reviwedState: 1,
                          acceptedState: 1
                    )

                    HomeworkItem(
                          homeWorkNumber: 2,
                          pushedState: 0,
                          reviwedState: 0,
                          acceptedState: 0
                    )

                    HomeworkItem(
                          homeWorkNumber: 3,
                          pushedState: 0,
                          reviwedState: 0,
                          acceptedState: 0
                    )

                    HomeworkItem(
                          homeWorkNumber: 4,
                          pushedState: 0,
                          reviwedState: 0,
                          acceptedState: 0
                    )

                    HomeworkItem(
                          homeWorkNumber: 5,
                          pushedState: 0,
                          reviwedState: 0,
                          acceptedState: 0
                    )

                    HomeworkItem(
                          homeWorkNumber: 6,
                          pushedState: 0,
                          reviwedState: 0,
                          acceptedState: 0
                    )

                }

            }

        }
        .sectionPadding()
        
    }
}
