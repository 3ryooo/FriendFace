//
//  ContentView.swift
//  FriendFace
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { item in
                Text(item.name)
                    .foregroundStyle(item.isActive ? Color.primary : Color.primary.opacity(0.5))
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
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode([User].self, from: data) else {
                    print("デコードエラー")
                    return
                }
                
                DispatchQueue.main.async {
                    users = decodedResponse
                }
                
            } else {
                print("リクエストエラー：\(error?.localizedDescription ?? "不明なエラー")")
            }
        }.resume()
        
    }
    
}

#Preview {
    ContentView()
}
