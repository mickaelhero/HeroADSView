//
//  HA+General.swift
//  HeroADSView
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

internal func associatedObject<ValueType>(base: AnyObject, key: UnsafePointer<UInt8>, initialiser: () -> ValueType) -> ValueType {
    guard let associated = objc_getAssociatedObject(base, key) as? ValueType else {
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,
                                 .OBJC_ASSOCIATION_RETAIN)
        return associated
    }
    
    return associated
}

internal func optionalAssociatedObject<ValueType>(base: AnyObject, key: UnsafePointer<UInt8>, initialiser: () -> ValueType?) -> ValueType? {
    guard let associated = objc_getAssociatedObject(base, key) as? ValueType else {
        let associated = initialiser()
        if associated != nil {
            objc_setAssociatedObject(base, key, associated!, .OBJC_ASSOCIATION_RETAIN)
        }
        
        return associated
    }
    
    return associated
}

internal func associateObject<ValueType>(base: AnyObject, key: UnsafePointer<UInt8>, value: ValueType) {
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
}

internal func associateOptionalObject<ValueType>(base: AnyObject, key: UnsafePointer<UInt8>, value: ValueType?) {
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
}

