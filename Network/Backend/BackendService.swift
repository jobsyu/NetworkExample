//
//  BackendService.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

public let DidPerformUnauthorizedOperation = "DidPerformUnauthorizedOperation"

class BackendService {
    
    private let conf: BackendConfiguration
    private let service = NetworkService()
    
    init(_ conf: BackendConfiguration) {
        self.conf = conf
    }
    
    func request(_ request: BackendAPIRequest, success: ((AnyObject?) -> Void)? = nil,failure: ((NSError) -> Void)? = nil) {
        
        let url = conf.baseURL.appendingPathComponent(request.endpoint)
        
        var headers = request.headers
        // Set authentication token if availabel.
        
        service.makeRequest(for: url, method: request.method, query: request.query, params: request.parameters, headers: headers, success: { data in
            var json: AnyObject? = nil
            if let data = data {
                json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
            }
            success?(json)
            
        }, failure: { data, error, statusCode in
            if statusCode  == 401 {
                // Operation not authorized
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: DidPerformUnauthorizedOperation), object: nil)
                return
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
                let info = [NSLocalizedDescriptionKey: json?["error"] as? String ?? "",NSLocalizedFailureReasonErrorKey: "Probably not allowed action."
                ]
                let error = NSError(domain: "BackendService", code: 0, userInfo: info)
                failure?(error)
            } else {
                failure?(error ?? NSError(domain: "BackendService", code: 0, userInfo: nil))
            }
        })
    }
    
    func cancel() {
        service.cancel()
    }

}
