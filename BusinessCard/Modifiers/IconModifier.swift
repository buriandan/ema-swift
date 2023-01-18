import SwiftUI

extension View {
    
    func profileBadge() -> some View {
        self
            .modifier(ProfileBadgeModifier())
    }
    
    func socialIcon() -> some View {
        self
            .modifier(SocialIconModifier())
    }
    
    func skillIcon() -> some View {
        self
            .modifier(SkillIconModifier())
    }
    
    func checkIcon() -> some View {
        self
            .modifier(CheckIconModifier())
    }
    
    func clockIcon() -> some View {
        self
            .modifier(ClockIconModifier())
    }

}

struct SocialIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 30, height: 30)
            .foregroundColor(Color("IconFillColor"))
            .scaledToFill()
            .padding(15)
            .background(
                Capsule()
                    .fill(Color("SocialIconBackground"))
            )
            .padding(.top, 15)
    }
}

struct SkillIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 30, height: 30)
            .foregroundColor(Color("IconFillColor"))
            .scaledToFill()
            .padding(15)
    }
}

struct ProfileBadgeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 30, height: 30)
            .offset(x: -20, y: 50)
            .padding(.trailing, -15)
            
    }
}

struct CheckIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("CheckIconFillColor"))
    }
}


struct ClockIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("ClockIconFillColor"))
    }
}
