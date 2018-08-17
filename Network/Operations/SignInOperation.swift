//
//  SignInOperation.swift
//  NetworkExample
//
//  Created by lianlv on 2018/8/16.
//  Copyright © 2018年 linktrip. All rights reserved.
//

import Foundation

public class SignInOperation: ServiceOperation {
    
    private let request: SignInRequest
    
    public var success: ((SignInItem) -> Void)?
    public var failure: ((NSError) -> Void)?
    
    public init(email: String, password: String) {
        request = SignInRequest(email: email, password: password)
        super.init()
    }
    
    public override func start() {
        super.start()
        service.request(request, success: handleSuccess, failure: handleFailure)
    }
    
    private func handleSuccess(_ response: AnyObject?) {
        do {
            let item = try SignInResponseMapper.process(response)
            self.success?(item)
            self.finish()
        } catch {
            handleFailure(NSError.cannotParseResponse())
        }
    }
    
    func handleFailure(_ error: NSError) {
        self.failure?(error)
        self.finish()
    }
}
