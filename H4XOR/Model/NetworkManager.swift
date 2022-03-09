//
//  NetworkManager.swift
//  H4XOR
//
//  Created by Nicolas Dolinkue on 07/03/2022.
//

import Foundation


// Observerobject es para castear la info
class NetworkManager: ObservableObject {
    
    @Published var  posts = [Post]()
    
    func fetchData() {
        if  let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error  in
                if error == nil {
                    let  decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                        let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        
                        }catch {
                            print(error)
                        }
                    }
                }
                }
            task.resume()
            }
        }
    }
    
    

