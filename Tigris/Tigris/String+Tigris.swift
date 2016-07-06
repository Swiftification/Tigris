//
//  String+Tigris.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation

public extension String {
    public var isEmpty: Bool {
        return self.length == 0
    }
    
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    public var length: Int {
        return self.characters.count
    }
}