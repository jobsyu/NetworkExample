//
//  BackendAPIRequest.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/15.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

protocol BackendAPIRequest {
    var endpoint: String { get }
    var method: NetworkService.Method { get }
    var query: NetworkService.QueryType { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension BackendAPIRequest {
    func defaultJSONHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}

















