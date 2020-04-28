//
//  RemoteImageURL.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let imageCache = NSCache<AnyObject, AnyObject>()

class RemoteImageURL: ObservableObject {
    @Published var downloadedImage: UIImage?
        
    func load(_ urlString: String) {
        /// Retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.downloadedImage = imageFromCache
            return
        }
        
        /// Create url from url string
        guard let imageUrl = URL(string: urlString) else {
            return
        }
        
        /// Load image from url
        URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            guard let data = data, error == nil else { return }
            
            if let imageToCache = UIImage(data: data) {
                /// Update image
                DispatchQueue.main.async {
                    strongSelf.downloadedImage = imageToCache
                }
                
                /// Set image to cache
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
            }
            
            
        }.resume()
    }
}
