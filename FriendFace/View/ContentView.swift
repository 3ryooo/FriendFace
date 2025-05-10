//
//  ContentView.swift
//  FriendFace
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar {
                Button("Get JSON") {
                    Task {
                        await fetchUsers()
                    }
                    
                }
            }
        }
    }
    
    func fetchUsers() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])
                print(object)
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
}

#Preview {
    ContentView()
}
