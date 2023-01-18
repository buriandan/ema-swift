import SwiftUI

enum ErrorModel: Error {
    case authorizationException
    case encodingExeption
    case decodingExeption(Error)
    case urlException
    case requestException
}
