//
//  ImageSingleton.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/8/21.
//

import UIKit

class ImageSingleton {
    
    static let shared = ImageSingleton()
    
    private var internalCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getImage(with url: URL, updateImageClosure: @escaping (UIImage) -> () ) {
        if let cachedImage = internalCache.object(forKey: url.absoluteString as NSString) {
//            print("getting image from cache")
            DispatchQueue.main.async {
                updateImageClosure(cachedImage)
            }
        } else {
//            print("getting image from API")
            DispatchQueue.global(qos: .userInitiated).async {
                guard let data = try? Data(contentsOf: url) else {return}
                let image = UIImage(data: data) ?? UIImage(named: "leaf.png")!
                DispatchQueue.main.async {
                    updateImageClosure(image)
                    self.internalCache.setObject(image, forKey: url.absoluteString as NSString)
                }
            }
        }
    }
    
}
