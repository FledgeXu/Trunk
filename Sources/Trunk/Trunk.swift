import Foundation
import Alamofire

public struct Trunk {
    let instanceURL: String
    public var accessToken: String
    let queue: DispatchQueue
    
    public init(instanceURL: String, accessToken: String = "", queue: DispatchQueue = .global()) {
        self.instanceURL = instanceURL
        self.accessToken = accessToken
        self.queue = queue
    }
    public func run<Model: Codable, Parameters: Encodable>(request: Request<Model, Parameters>) {
        guard
            let components = URLComponents(baseURL: instanceURL, request: request),
            let url = components.url
        else {
            //            completion(.failure(MastodonError.URLError))
            return
        }
        var dataRequest: DataRequest
        switch request.method {
        default:
            switch request.method.parameters {
            case .parameters(let parameters):
                dataRequest = AF.request(url, method: request.method.type, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
            case .media(let parameters):
                dataRequest = AF.request(url, method: request.method.type, parameters: parameters)
            default:
                dataRequest = AF.request(url, method: request.method.type)
            }
        }
        //        dataRequest.responseData(queue: .global()) { response in
        //            switch response.result {
        //            case .success(let data):
        //                let str = String(decoding: data, as: UTF8.self)
        //                print(str)
        //                guard let model  = try? Model.decode(data: data) else {
        //                    return
        //                }
        //                debugPrint(model)
        //            case let .failure(error):
        //                print(error)
        //            }
        //        }
        //        dataRequest.responseJSON(queue: queue) { response in
        //            switch response.result {
        //            case .success(let data):
        //                debugPrint(data)
        //            case let .failure(error):
        //                print(error)
        //            }
        //        }
        dataRequest.responseDecodable(of: Model.self, queue: queue) { response in
            switch response.result {
            case .success(let data):
                debugPrint(data)
            case let .failure(error):
                print(error)
            }
        }
    }
}
