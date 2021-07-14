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
        switch request.method.parameters {
        case .PARAMETERS(let parameters):
            dataRequest = AF.request(url, method: request.method.type, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: [.authorization(bearerToken: accessToken)])
        case .MEDIA(let parameters):
            dataRequest = AF.upload(multipartFormData: { multipartFormData in
                parameters.forEach { (key: String, value: Data) in
                    multipartFormData.append(value, withName: key, fileName: key)
                }
            }, to: url, headers: [.authorization(bearerToken: accessToken)])
        default:
            dataRequest = AF.request(url, method: request.method.type, headers: [.authorization(bearerToken: accessToken)])
        }
        dataRequest.responseData(queue: .global()) { response in
            switch response.result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
//                print(str)
                let jsonData = str.data(using: .utf8)!
                guard let model = try? JSONDecoder().decode(Model.self, from: jsonData) else {
                    guard let error = try? JSONDecoder().decode(Error.self, from: jsonData) else {
                        return
                    }
                    print(error.error)
                    return
                }
                debugPrint(model)
            case let .failure(error):
                print(error)
            }
        }
        //        dataRequest.responseJSON(queue: queue) { response in
        //            switch response.result {
        //            case .success(let data):
        //                debugPrint(data)
        //            case let .failure(error):
        //                print(error)
        //            }
        //        }
        //                dataRequest.responseDecodable(of: Model.self, queue: queue) { response in
        //                    switch response.result {
        //                    case .success(let data):
        //                        debugPrint(data)
        //                    case let .failure(error):
        //                        print(error)
        //                    }
        //                }
    }
}
