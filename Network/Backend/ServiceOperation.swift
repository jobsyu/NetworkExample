//
//  ServiceOperation.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

public class ServiceOperation: NetworkOperation {
    
    let service: BackendService
    
    public override init() {
        self.service = BackendService(BackendConfiguration.shared)
        super.init()
    }
    
    public override func cancel() {
        service.cancel()
        super.cancel()
    }
}
