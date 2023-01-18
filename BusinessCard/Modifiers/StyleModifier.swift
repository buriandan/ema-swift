import SwiftUI

extension View {
    
    func sectionPadding() -> some View {
        self
            .modifier(SectionPaddingModifier())
    }
    
    func stateText() -> some View {
        self
            .modifier(StateTextModifier())
    }
    
    func profilePhoto() -> some View {
        self
            .modifier(ProfilePhotoModifier())
    }

}

struct SectionPaddingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.bottom, .leading, .trailing], 15)
    }
}

struct ProfilePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
    }
}

struct StateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.gray)
    }
}
