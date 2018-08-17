//
//  NetworkQueue.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

public class NetworkQueue {
    
    public static var shared: NetworkQueue!
    
    let queue = OperationQueue()
    
    public init() {}
    
    public func addOperation(_ op: Operation) {
        queue.addOperation(op)
    }
    
}
