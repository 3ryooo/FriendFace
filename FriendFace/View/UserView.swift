//
//  UserView.swift
//  FriendFace
//

import SwiftUI
import SwiftData

struct UserView: View {
    let user: User
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Text("名前：\(user.name)")
                    Text("アクティブ：\(user.isActive ? "YES" : "NO")")
                    Text("年齢：\(user.age)")
                    Text("会社名：\(user.company)")
                    Text("メールアドレス：\(user.email)")
                    Text("概要：\(user.about)")
                    Text("登録日時:\(dateFormat(user.registered))")
                }
                Section {
                    List {
                        ForEach(user.tags, id: \.self) {
                            Text($0)
                        }
                    }
                    
                } header: {
                    Text("タグ")
                }
                Section {
                    List {
                        ForEach(user.friends, id: \.id) { friend in
                            Text(friend.name)
                        }
                    }
                   
                } header: {
                    Text("友達リスト")
                }
            }
            .navigationTitle("プロフィール")
        }
    }
    
    func dateFormat(_ plainDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let dateString = dateFormatter.string(from: plainDate)
        
        return dateString
    }
    
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let dateFormatter = ISO8601DateFormatter()
        let dateString = "2015-11-10T01:47:18-00:00"
        let date = dateFormatter.date(from: dateString) ?? Date()
        let example = User(id: "abc", isActive: true, name: "Test User", age: 20, company: "Test Company", email: "test@example.com", address: "123 Test St", about: "This is a test user.", registered: date, tags: ["test", "test2"], friends: [User.Friend(id: "friend1", name: "Test Friend")])
        
        return  UserView(user: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
