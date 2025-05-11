//
//  ContentView.swift
//  FriendFace
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { item in
                NavigationLink(item.name){
                    UserView(user: item)
                }
                .foregroundStyle(item.isActive ? Color.primary : Color.primary.opacity(0.5))
            }
            .onAppear {
                Task {
                    await fetchUsers()
                }
            }
            .navigationTitle("フレンドリスト")
        }
    }
        



func fetchUsers() async {
    
    if !users.isEmpty {
        return
    }
    
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
        return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            guard let decodedUsers = try? decoder.decode([User].self, from: data) else {
                print("デコードエラー")
                return
            }
            
            DispatchQueue.main.async {
                for decodedUser in decodedUsers {
                    modelContext.insert(decodedUser)
                }
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
