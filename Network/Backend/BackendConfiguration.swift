//
//  BackendConfiguration.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/15.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

public final class BackendConfiguration {
    let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public static var shared: BackendConfiguration!
}
