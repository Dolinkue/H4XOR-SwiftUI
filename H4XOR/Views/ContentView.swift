//
//  ContentView.swift
//  H4XOR
//
//  Created by Nicolas Dolinkue on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            // creamos con un closure para la lectura de las notas, en cada posts usamos el post
            List(networkManager.posts) { post in
                
                // navigation es para poder ingresar en cada post
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationTitle("H4XOR NEWS")
        }
        // es un clouser que actualiza la lista
        .onAppear {
            self.networkManager.fetchData()
        }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


