//
//  Array+Tigris.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public extension Array {
    
    public func random() -> Element? {
        guard count > 0 else {
            return nil
        }
        
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
    public func containsInstanceOf<T>(object: T) -> Bool {
        for item in self {
            if item.dynamicType == object.dynamicType {
                return true
            }
        }
        return false
    }
    
    subscript (has index: Int) -> Element? {
        
        guard endIndex > index && index >= 0 else {
            return nil
        }
        return self[index]
    }
    
    
    public func testAll(test: (Element) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }
    
    public func testIfAllIs(condition: Bool) -> Bool {
        for item in self {
            guard let item = item as? Bool else { return false }
            
            if item != condition {
                return false
            }
        }
        return true
    }
    
    public func get(index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
    
    public func reverseIndex(index: Int) -> Int {
        return Swift.max(self.count - 1 - index, 0)
    }
    
    public func takeMax(n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }
    
    public func each(call: (Element) -> ()) {
        for item in self {
            call(item)
        }
    }
    
    public func each(call: (Int, Element) -> ()) {
        for (index, item) in enumerate() {
            call(index, item)
        }
    }
    
    public func mapFilter<V>(mapFunction map: (Element) -> (V)?) -> [V] {
        var mapped = [V]()
        each { (value: Element) -> Void in
            if let mappedValue = map(value) {
                mapped.append(mappedValue)
            }
        }
        return mapped
    }
    
    public mutating func insertAsFirst(newElement: Element) {
        insert(newElement, atIndex: 0)
    }
    
    public mutating func shuffle() {
        var j: Int
        
        for i in 0..<(count-2) {
            j = Int(arc4random_uniform(UInt32(count - i)))
            if i != i+j { swap(&self[i], &self[i+j]) }
        }
    }
}

public extension Array where Element: Equatable {
    
    public func indexesOf(object: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count {
            if self[index] == object {
                indexes.append(index)
            }
        }
        return indexes
    }
    
    public func lastIndexOf(object: Element) -> Int? {
        return indexesOf(object).last
    }
    
    public func contains(items: Element...) -> Bool {
        return items.testAll { self.indexOf($0) >= 0 }
    }
    
    public func difference(values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                if value.contains(element) {
                    continue elements
                }
            }
            result.append(element)
        }
        return result
    }
    
    public func intersection(values: [Element]...) -> Array {
        var result = self
        var intersection = Array()
        
        for (i, value) in values.enumerate() {
            if i > 0 {
                result = intersection
                intersection = Array()
            }
            
            value.each { (item: Element) -> Void in
                if result.contains(item) {
                    intersection.append(item)
                }
            }
        }
        return intersection
    }
    
    public func union(values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }
    
    public mutating func remove(object: Element) {
        if let index = indexOf(object) {
            removeAtIndex(index)
        }
    }
    
    public mutating func remove(objects: [Element]) {
        for object in objects {
            remove(object)
        }
    }
    
    public func containsArray(lookFor: [Element]) -> Bool {
        for item in lookFor {
            if contains(item) == false {
                return false
            }
        }
        return true
    }
}

public func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case (.Some(let lhs), .Some(let rhs)):
        return lhs == rhs
    case (.None, .None):
        return true
    default:
        return false
    }
}
