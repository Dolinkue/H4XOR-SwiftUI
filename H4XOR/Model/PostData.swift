//
//  PostData.swift
//  H4XOR
//
//  Created by Nicolas Dolinkue on 07/03/2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

// Indetifiable siempre tiene que tener una variable ID con lo cual en este caso creamos una variable como funcion para retornar el ID
struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
