//
//  NetworkManager.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 17.12.2022.
//

import Foundation

let urlString = "https://go-apod.herokuapp.com/apod"

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchImage(from url: String?, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData )
                
            }
        }
    }
}
