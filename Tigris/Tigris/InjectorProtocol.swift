//
//  Injector.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public protocol InjectorProtocol {
    func hasMapping(instance: AnyObject) -> Bool
    
    func hasMapping(key: String) -> Bool
    
    func map(instance: AnyObject) -> InjectionMapping
    
    func map(instance: AnyObject, key: String?) -> InjectionMapping
    
    func unmap(instance: AnyObject)
    
    func unmap(key: String)
    
    func get(instance: AnyObject) -> AnyObject?
    
    func get(key: String) -> AnyObject?
}