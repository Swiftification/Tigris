//
//  LifeCycle.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public protocol LifeCycleProtocol {
    func initialize(callback: () -> Void)
    
    func destroy(callback: () -> Void)
    
    var isInitialized: Bool { get }
    
    var isDestroyed: Bool { get }
}

class LifeCycle: LifeCycleProtocol {
    private var _isInitialized: Bool = false
    private var _isDestroyed: Bool = false
    
    func initialize(callback: () -> Void) {
        // TODO: Add initialization scope
    }
    
    func destroy(callback: () -> Void) {
        // TODO: Add deinitialization scope
    }
    
    var isInitialized: Bool {
        get {
            return _isInitialized
        }
    }
    
    var isDestroyed: Bool {
        get {
            return _isDestroyed
        }
    }
}