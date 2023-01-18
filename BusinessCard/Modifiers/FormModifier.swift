import SwiftUI

extension View {
    
    func textField() -> some View {
        self
            .modifier(TextFieldModifier())
    }
    
    func loginButton() -> some View {
        self
            .modifier(LoginButtonModifier())
    }
    
    func smallButton() -> some View {
        self
            .modifier(SmallButtonModifier())
    }

}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(height: 35)
    }
}

struct LoginButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
            .buttonStyle(DefaultButtonStyle())
            .padding(10)
    }
}

struct SmallButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.accentColor)
            .cornerRadius(8)
            .buttonStyle(DefaultButtonStyle())
    }
}
