import SwiftUI

enum PlatformType: String, CaseIterable, Identifiable {
    case ios = "iosStudent"
    case android = "androidStudent"
    
    var id: String { rawValue }
    
    var pickerLabel : String {
        switch self {
        case .ios : return "iOS"
        case .android : return "Android"
        }
    }
}
