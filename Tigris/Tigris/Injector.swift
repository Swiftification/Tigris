//
//  Injector.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

enum InjectorError: ErrorType {
    case InvalidKey
    case InjectionInProcesss
}

class Injector: InjectorProtocol {
    private var mappings: [String:InjectionMapping]
    private var mappingsInProcess: [String:Bool]
    
    init() {
        self.mappings = [:]
        self.mappingsInProcess = [:]
    }
    
    // MARK: - InjectorProtocol
    
    func hasMapping(instance: AnyObject) -> Bool {
        let key = self.mappingId(instance)
        return hasMapping(key)
    }
    
    func hasMapping(key: String) -> Bool {
        return self.mappings.has(key)
    }
    
    func map(instance: AnyObject) -> InjectionMapping {
        return map(instance, key: "")
    }
    
    func map(instance: AnyObject, key: String?) -> InjectionMapping {
        let mappingId = self.mappingId(instance, key: key)
        return self.hasMapping(mappingId) ? self.mappings[mappingId]! : self.createMapping(instance, key: mappingId)
    }
    
    func unmap(instance: AnyObject) {
        let key = self.mappingId(instance)
        unmap(key)
    }
    
    func unmap(key: String) {
        if self.mappings.has(key) {
            self.mappings.removeValueForKey(key)
        }
    }
    
    func get(instance: AnyObject) -> AnyObject? {
        let key = self.mappingId(instance)
        return get(key)
    }
    
    func get(key: String) -> AnyObject? {
        return self.mappings[key]?.result
    }
    
    func getMapping(type: AnyClass) -> InjectionMapping {
        return getMapping(type, name: "")
    }
    
    func getMapping(type: AnyClass, name: String) -> InjectionMapping {
        let mappingId = self.mappingId(type, key: name)
        return self.mappings[mappingId]!
    }
    
    private func createMapping(instance: AnyObject, key: String) -> InjectionMapping {
        // TODO: Check if mapping is in process
        //if (self.mappingsInProcess.has(id))
        //    print("Cannot change a mapping during its creation")
        
        self.mappingsInProcess[key] = true
            
        let mapping = InjectionMapping(creatingInjector: self, instance: instance, mappingId: key)
        self.mappings[key] = mapping
        
        self.mappingsInProcess.removeValueForKey(key)
        return mapping
    }
    
    private func mappingId(instance: AnyObject, key: String? = "") -> String {
        if ((key) != nil && (key?.isNotEmpty)!) {
            return key!
        } else {
            return NSStringFromClass(instance.dynamicType)
        }
    }
}