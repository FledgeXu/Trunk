import Foundation
import Alamofire

public struct Trunk {
    let instanceURL: String
    let session: URLSession
    public var accessToken: String
    
    public init(instanceURL: String, accessToken: String = "", session: URLSession = .shared) {
        self.instanceURL = instanceURL
        self.accessToken = accessToken
        self.session = session
    }
    public func run<Model: Codable>(request: Request<Model>, completion: @escaping (Model) -> Void) {
        guard
            let components = URLComponents(baseURL: instanceURL, request: request),
            let url = components.url
        else {
            //                completion(.failure(ClientError.malformedURL))
            return
        }
        let urlReuqest = URLRequest(url: url, request: request, accessToken: accessToken)
        let task = session.dataTask(with: urlReuqest) { data, response, error in
            if error != nil {
                //                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                //                completion(.failure(ClientError.malformedJSON))
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                //                let mastodonError = try? MastodonError.decode(data: data)
                //                let error: ClientError = mastodonError.map { .mastodonError($0.description) } ?? .genericError
                //                completion(.failure(error))
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse?.statusCode)
                let str = String(data: data, encoding: .utf8)
                print(str)
                return
            }
            
            //            guard let model = try? Model.decode(data: data) else {
            //                completion(.failure(ClientError.invalidModel))
            //                return
            //            }
            guard  let result = try? JSONDecoder().decode(Model.self, from: data) else {
                return
            }
            completion(result)
            //            let str = String(data: data, encoding: .utf8)
            //            print(str)
            
            //            completion(.success(model, httpResponse.pagination))
        }
        task.resume()
    }
}
