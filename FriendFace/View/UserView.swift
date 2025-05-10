//
//  UserView.swift
//  FriendFace
//

import SwiftUI

struct UserView: View {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    UserView(user: User(id: "abc", isActive: true, name: "Test User", age: 20, company: "Test Company", email: "test@example.com", address: "123 Test St", about: "This is a test user.", tags: ["test"], friends: [User.Friend(id: "friend1", name: "Test Friend")]))
}
