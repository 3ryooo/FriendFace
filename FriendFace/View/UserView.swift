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
                    Text("タグ：\(user.tags)")
                    Text("フレンド：\(user.friends)")
                }
            }
        }
    }
}

#Preview {
    UserView(user: User(id: "abc", isActive: true, name: "Test User", age: 20, company: "Test Company", email: "test@example.com", address: "123 Test St", about: "This is a test user.", tags: ["test"], friends: [User.Friend(id: "friend1", name: "Test Friend")]))
}
