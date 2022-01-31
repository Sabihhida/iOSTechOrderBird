//
//  NetworkServiceError.swift
//  codeChallenge
//
//  Created by Sabih Tahir on 31/01/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import UIKit

enum NetworkServiceError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData(errorCode: Int?, errorDescription: String?)
    case connectionFailed
    case serverError
    case invalideURL
}

