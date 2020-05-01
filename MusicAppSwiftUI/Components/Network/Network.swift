//
//  Network.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/30.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    
    private init() {
        
    }
    
    func getAlbums() -> [Album] {
        var result: [Album] = []
        
        guard let path = Bundle.main.path(forResource: "Album", ofType: "json") else {
            return result
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? [String: Any], 
                let albums = jsonResult["albums"] as? [[String: Any]] {
                let decoder = JSONDecoder()
    
                albums.forEach({
                    if let data = try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted),
                        let album = try? decoder.decode(Album.self, from: data) {
                        result.append(album)
                    }
                })
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
        return result
    }
}
