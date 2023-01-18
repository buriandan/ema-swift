import Foundation
import Combine

struct LoginRepository {
    
    func loginUser(for username: String, for password: String) -> AnyPublisher<LoginResponse, Error> {
      
        let loginRequest = LoginModel(username: username, password: password)
        
        return Just(URL(string: "http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/login"))
            .flatMap { url -> AnyPublisher<URLRequest, ErrorModel> in
                guard let url = url else {
                    return Fail(error: ErrorModel.urlException)
                        .eraseToAnyPublisher()
                }
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let encoder = JSONEncoder()
                
                guard let data = try? encoder.encode(loginRequest) else {
                    return Fail(error: ErrorModel.encodingExeption)
                        .eraseToAnyPublisher()
                }
                urlRequest.httpBody = data
                
                return Just(urlRequest)
                    .setFailureType(to: ErrorModel.self)
                    .eraseToAnyPublisher()
            }
            .flatMap { urlRequest in
                URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .mapError { _ in
                        ErrorModel.urlException
                    }
                    .eraseToAnyPublisher()
            }
            .flatMap { output -> AnyPublisher<Data, ErrorModel> in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    return Fail(error: ErrorModel.requestException)
                        .eraseToAnyPublisher()
                }
                
                return Just(output.data)
                    .setFailureType(to: ErrorModel.self)
                    .eraseToAnyPublisher()
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .mapError { error in
                ErrorModel.decodingExeption(error)
            }
            .eraseToAnyPublisher()
        
    }
}
