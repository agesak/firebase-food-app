//
//  UserView.swift
//  swiftui-appdelegate
//
//  Created by Kareha on 1/27/21.
//

import SwiftUI
import Firebase

struct UserView: View {
    var body: some View {
        Home()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

struct Home : View {
    
    @ObservedObject var users = getUsersData()
    @State var username : String = ""
    
    var body : some View{
  
        VStack{
            
            Text("Sign Up")
                .font(.largeTitle)
            TextField("Username", text: $username)
            
//            List(users.data){i in
//
//                Text(i.username)
//
//
//            }
        }
    }
}

//displaying the data
class getUsersData : ObservableObject {
    @Published var data = [user]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("users").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let username = i.document.get("username") as! String
                let password = i.document.get("password") as! String
                let email = i.document.get("email") as! String
                
                self.data.append(user(id: id, username: username, email: email, password: password))
            }
        }
    }
}

struct user : Identifiable {
    
    var id : String
    var username : String
    var email : String
    var password : String
}
