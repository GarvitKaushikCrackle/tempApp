//
//  testSDK.swift
//  testSDK
//
//  Created by Garvit Kaushik on 30/07/24.
//

import Foundation

public class testSDK {
    public init () {}
    
    public func logger_public() {
        print("Hi testSDK is working fine - public func")
    }
    
    internal func logger_internal() {
        print("Hi testSDK is working fine - internal func")
    }
    
    private func logger_private() {
        print("Hi testSDK is working fine - private func")
    }
}
