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
    
    @ObservedObject var categories = getCategoriesData()
    
    var body : some View{
  
//        Text(categories.datas)
        VStack{
            
            List(categories.datas){i in

                Text(i.name)


            }
        }
    }
}

class getCategoriesData : ObservableObject {
    @Published var datas = [category]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("categories").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let price = i.document.get("price") as! String
                
                self.datas.append(category(id: id, name: name, price: price))
            }
        }
    }
}

struct category : Identifiable {
    
    var id : String
    var name : String
    var price : String
}
