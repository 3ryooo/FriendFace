//
//  UserView.swift
//  FriendFace
//

import SwiftUI

struct UserView: View {
    let user: User
    
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
                    Text("登録日時:\(user.registered)")
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
        }
    }
    
    
}

#Preview {
    UserView(user: User(id: "abc", isActive: true, name: "Test User", age: 20, company: "Test Company", email: "test@example.com", address: "123 Test St", about: "This is a test user.", registered: "2015-11-10T01:47:18-00:00", tags: ["test", "test2"], friends: [User.Friend(id: "friend1", name: "Test Friend")]))
}
