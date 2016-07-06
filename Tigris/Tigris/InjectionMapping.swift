//
//  InjectionMapping.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public class InjectionMapping {
    private var instance: AnyObject
    private var mappingId: String
    private var creatingInjector: InjectorProtocol
    var result: AnyObject?
    
    init(creatingInjector: InjectorProtocol, instance: AnyObject, mappingId: String) {
        self.creatingInjector = creatingInjector
        self.mappingId = mappingId
        self.instance = instance
    }
    
    public func asSingleton(initializeImmediately: Bool = false) {
        toSingleton(self.instance, initializeImmediately: initializeImmediately)
    }
    
    public func toSingleton(instance: AnyObject, initializeImmediately: Bool = false) {
        // TODO add to Singleton scope
        //if (initializeImmediately) {
            self.result = instance
        //}
    }
    
    public func toValue(value: AnyObject, autoInject: Bool = false, destroyOnUnmap: Bool) {
        // TODO add to value scope
    }
    
}
