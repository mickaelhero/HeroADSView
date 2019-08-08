//
//  HA+UIImageView.swift
//  HeroADSView
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private struct AssociatedObjectKeys {
        static var cacheUrl: UInt8 = 10
    }
    
    var imageUrlString: String? {
        get {
            return associatedObject(base: self, key: &AssociatedObjectKeys.cacheUrl) { return nil }
        }
        set {
            associateObject(base: self, key: &AssociatedObjectKeys.cacheUrl, value: newValue)
        }
    }
    
    var imageCached: NSCache<AnyObject, AnyObject> {
        get {
            return associatedObject(base: self, key: &AssociatedObjectKeys.cacheUrl) { return NSCache<AnyObject, AnyObject>() }
        }
        set {
            associateObject(base: self, key: &AssociatedObjectKeys.cacheUrl, value: newValue)
        }
    }
    
    
    func loadAndCacheImage(from url: URL, completion: ((_ image: UIImage?) -> ())? = nil) {
        let urlString = url.absoluteString
        self.image = nil
        
        if let imageFromCache = imageCached.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.image = image
                    
                    completion?(image)
                    
                    if let image = image {
                        self.imageCached.setObject(image, forKey: urlString as AnyObject)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion?(nil)
                }
            }
        }
    }
    
    func loadImage(from url: URL, completion: ((_ image: UIImage?) -> ())? = nil) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.image = image
                    
                    completion?(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion?(nil)
                }
            }
        }
    }
    
}


