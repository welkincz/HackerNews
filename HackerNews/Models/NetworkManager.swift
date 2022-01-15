//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Charlie G on 2022/1/8.
//

import Foundation
import UIKit


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }   catch {
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
        }
            
    }
}
