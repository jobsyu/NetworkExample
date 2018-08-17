//
//  ResponseMapper.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

protocol ResponseMapperProtocol {
    associatedtype Item
    static func process(_ obj: AnyObject?) throws -> Item
}

internal enum ResponseMapperError: Error {
    case invalid
    case missingAttribute
}

class ResponseMapper<A: ParsedItem> {
    
    static func process(_ obj: AnyObject?, parse: (_ json: [String: AnyObject]) -> A?) throws -> A {
        guard let json = obj as? [String: AnyObject] else {
            throw ResponseMapperError.invalid
        }
        
        if let item = parse(json) {
            return item
        } else {
            throw ResponseMapperError.missingAttribute
        }
    }
}























