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
    
    func configure(injector: InjectorProtocol) {
        let someUser = UserModel(firstName: "Gabriel", lastName: "Peart")
        let flashInjectionKey = "flash"
        let someOtherUser = UserModel(firstName: "Barry", lastName: "Allen")
        injector.map(someUser).asSingleton()
        injector.map(someOtherUser, key: flashInjectionKey).asSingleton()
        
        // Simulating unmapping
        // injector.unmap(someUser)
        
        if let flash = injector.get(flashInjectionKey) as? UserModel {
            print(flash.fullName)
        }

        if let user = injector.get(UserModel) as? UserModel {
            print(user.fullName)
        }
    }
}