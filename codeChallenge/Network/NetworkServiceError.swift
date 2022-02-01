//
//  NetworkServiceError.swift
//  codeChallenge
//
//  Created by Sabih Tahir on 31/01/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import UIKit

@objc enum NetworkServiceError: Int, Error {
    case invalidResponse
    case noData
    case failedRequest
    case connectionFailed
    case serverError
    case invalideURL
}

extension NetworkServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("Response Invalid.", comment: "My error")
        case .noData:
            return NSLocalizedString("Data not Found", comment: "My error")

        case .failedRequest:
            return NSLocalizedString("Request Failed.", comment: "My error")

        case .connectionFailed:
            return NSLocalizedString("A user-friendly description of the error.", comment: "My error")

        case .serverError:
            return NSLocalizedString("A user-friendly description of the error.", comment: "My error")

        case .invalideURL:
            return NSLocalizedString("A user-friendly description of the error.", comment: "My error")

        }
    }
}
