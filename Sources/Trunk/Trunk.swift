import Foundation

public struct Trunk {
    let instanceURL: String
    let session: URLSession
    public var accessToken: String
    
    public init(instanceURL: String, accessToken: String = "", session: URLSession = .shared) {
        self.instanceURL = instanceURL
        self.accessToken = accessToken
        self.session = session
    }
    public func run<Model: Codable>(request: Request<Model>, completion: @escaping (_ result: Result<Model, TrunkError>, _ headers: [AnyHashable : Any]?) -> Void) {
        guard
            let components = URLComponents(baseURL: instanceURL, request: request),
            let url = components.url
        else {
            completion(.failure(.urlError), nil)
            return
        }
        let urlReuqest = URLRequest(url: url, request: request, accessToken: accessToken)
        let task = session.dataTask(with: urlReuqest) { data, response, error in
            if let taskError = error {
                completion(.failure(.dataTaskError(taskError)), nil)
                return
            }
            guard let data = data else {
                completion(.failure(.malformedData), nil)
                return
            }
            guard
                let httpResponse = response as? HTTPURLResponse
            else {
                let str = String(data: data, encoding: .utf8)
                completion(.failure(.responseErrorWithoutErrorType(str)), nil)
                return
            }
            if(200...299).contains(httpResponse.statusCode) {
                do {
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    completion(.success(result), httpResponse.allHeaderFields)
                    return
                } catch let parseError{
                    completion(.failure(.modelParseError(parseError)), httpResponse.allHeaderFields)
                    return
                }
            } else {
                if let errorData = try? JSONDecoder().decode(Error.self, from: data) {
                    completion(.failure(.responseErrorWithErrorType(errorData)), httpResponse.allHeaderFields)
                    return
                }
            }
        }
        task.resume()
    }
}
