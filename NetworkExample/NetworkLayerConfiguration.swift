//
//  NetworkLayerConfiguration.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

class NetworkLayerConfiguration {
    
    class func setup() {
        // Backend Configuration
        let url = URL(string: "https://fake.url")!
        let conf = BackendConfiguration(baseURL: url)
        BackendConfiguration.shared = conf
        
        //NetworkQueue
        NetworkQueue.shared = NetworkQueue()
    }
}
