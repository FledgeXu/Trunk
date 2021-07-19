import Foundation
import Combine

public struct Trunk {
    let instanceURL: String
    let session: URLSession
    public var accessToken: String
    
    /// Init Trunk Instance to run commands
    /// - Parameters:
    ///   - instanceURL: the URL of the Mastodon Instance
    ///   - accessToken: App's accessToken
    ///   - session: URLSession, default `URLSession.shared`
    public init(instanceURL: String, accessToken: String = "", session: URLSession = .shared) {
        self.instanceURL = instanceURL
        self.accessToken = accessToken
        self.session = session
    }
    
    
    /// Runn Task
    /// - Parameter request: API Endpoint
    /// - Throws: URLError
    /// - Returns: Publisher.
    public func run<Model: Codable>(request: Request<Model>) throws -> AnyPublisher<Model, Swift.Error> {
        guard
            let components = URLComponents(baseURL: instanceURL, request: request),
            let url = components.url
        else {
            throw URLError(.badURL)
        }
        let urlReuqest = URLRequest(url: url, request: request, accessToken: accessToken)
        return session.dataTaskPublisher(for: urlReuqest)
            .tryMap({ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            })
            .decode(type: Model.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
