//
//  Context.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public protocol ContextProtocol {
    var injector: InjectorProtocol { get }
    
    func configure(config: Config...) -> ContextProtocol
    
    func initialize(callback: () -> Void)
    
    func destroy(callback: () -> Void)
}

class Context: ContextProtocol {
    private let _injector: InjectorProtocol = Injector()
    private let lifeCycle: LifeCycleProtocol = LifeCycle()
    
    var injector: InjectorProtocol {
        get {
            return _injector
        }
    }
    
    init() {
        setup()
    }
    
    private func setup() {
        // TODO: Do setup here
    }
    
    func configure(configs: Config...) -> ContextProtocol {
        for config in configs {
            config.configure()
        }
        return self
    }
    
    func initialize(callback: () -> Void) {
        lifeCycle.initialize(callback)
    }
    
    func destroy(callback: () -> Void) {
        lifeCycle.destroy(callback)
    }
}