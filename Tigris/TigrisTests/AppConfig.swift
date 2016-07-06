//
//  AppConfig.swift
//  Tigris
//
//  Created by Gabriel Peart on 2016-07-06.
//  Copyright © 2016 Gabriel Peart. All rights reserved.
//

import Foundation
import Tigris

class UserModel {
    var firstName: String = ""
    var lastName: String = ""
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

class AppConfig: Config {
    
    func configure() {
        let someUser = UserModel(firstName: "Gabriel", lastName: "Peart")
        injector.map(someUser).asSingleton()
        
        // Simulating unmapping
        // injector.unmap(someUser)
        
        if let user = injector.get(UserModel) as? UserModel {
            print(user.fullName)
        }
    }
}