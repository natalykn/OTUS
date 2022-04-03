//
//  Injected.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-04-03.
//

import SwiftUI
import ServiceLocator

@propertyWrapper
struct Injected<T: AnyObject> {
    private var service: T?
    private weak var serviceManager = ServiceLocator.instance

    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service =  serviceManager?.service()
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }

    public var projectedValue:Injected<T> {
        get {return self}
        mutating set {self = newValue}
    }
}
