//
//  ContentView.swift
//  HackerNews
//
//  Created by Charlie G on 2022/1/6.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View{
        NavigationView{
            List(networkManager.posts)
            {
                post in NavigationLink(destination: DetailView(url: post.url))
                {
                    HStack
                    {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("HACKER NEWS")
        }
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





//let posts = [
//    Post(id: "1", title: "Hello1"),
//    Post(id: "2", title: "Hello2"),
//    Post(id: "3", title: "Hello3")
//]
