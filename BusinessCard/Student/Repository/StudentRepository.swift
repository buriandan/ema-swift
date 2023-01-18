import Foundation
import Combine

struct StudentRepository {
    
    let defaults = UserDefaults.standard
    
    func getStudentsById(for id: String) -> AnyPublisher<StudentModel, Error> {
        
        return Just(URL(string: "http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/participants/\(id)"))
            .flatMap { url -> AnyPublisher<URLRequest, ErrorModel> in
                guard let url = url else {
                    return Fail(error: ErrorModel.urlException)
                        .eraseToAnyPublisher()
                }
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "GET"
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue(defaults.string(forKey: "cz.buriandan.businessCard.access_token") ?? "", forHTTPHeaderField: "access_token")
                
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
                      401 != httpResponse.statusCode else {
                    return Fail(error: ErrorModel.authorizationException)
                        .eraseToAnyPublisher()
                }
                
                guard let httpResponse = output.response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    return Fail(error: ErrorModel.requestException)
                        .eraseToAnyPublisher()
                }
            
                return Just(output.data)
                    .setFailureType(to: ErrorModel.self)
                    .eraseToAnyPublisher()
            }
            .decode(type: StudentModel.self, decoder: JSONDecoder())
            .mapError { error in
                ErrorModel.decodingExeption(error)
            }
            .eraseToAnyPublisher()
        
    }
        
}
