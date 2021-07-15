//
//  Payload.swift
//  
//
//  Created by Fledge Shiu on 2021/7/13.
//

import Foundation

public let BoundaryUUID = "Boundary-90aa3bbf-a7c0-46a7-863a-3cf1cf89fb3b"
public enum Payload {
    case PARAMETERS([Parameter]?)
    case MEDIA([Parameter]?, [DataParameter]?)
    case EMPTY
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .PARAMETERS(let parameters):
            return parameters?.compactMap(toQueryItem)
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .PARAMETERS(let parameters):
            return parameters?
                .compactMap(toString)
                .joined(separator: "&")
                .data(using: .utf8)
        case .MEDIA(let parameters, let media):
            return createDataBody(withParameters: parameters, media: media, boundary: BoundaryUUID)
        default:
            return nil
        }
    }
    
    var contentType: String? {
        switch self {
        case .PARAMETERS(let parameters):
            return parameters.map { _ in "application/x-www-form-urlencoded; charset=utf-8"}
        case .MEDIA(let parameters, let media):
            if parameters != nil && media != nil{
                return media.map { _ in "multipart/form-data; boundary=\(BoundaryUUID)"}
            }
            return nil
        default:
            return nil
        }
    }
    
    func createDataBody(withParameters params: [Parameter]?, media: [DataParameter]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        params?.forEach({ parameter in
            if let value = parameter.value {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(parameter.key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        })
        media?.forEach({ parameter in
            if let data = parameter.value {
                let mimeType = Swime.mimeType(data: data)
                let ext = mimeType?.ext ?? "txt"
                let fileName = UUID().uuidString + "." + ext
                let mime = mimeType?.mime ?? "text/plain"
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(parameter.key)\"; filename=\"\(fileName)\"\(lineBreak)")
                body.append("Content-Type: \(mime + lineBreak + lineBreak)")
                body.append(data)
                body.append(lineBreak)
            }
        })
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
}
