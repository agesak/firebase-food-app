//
//  ContentView.swift
//  swiftui-appdelegate
//
//  Created by Kareha on 1/26/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var showMenu = false
    
    var body: some View {
        
        return NavigationView {
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .navigationBarItems(leading: (
                                Button(action: {
                                    withAnimation {
                                        self.showMenu.toggle()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .imageScale(.large)
                                }
                            ))
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var categories = getCategoriesData()
    
    var body: some View {

  
        ZStack {
            if colorScheme == .dark {
                Image("barbell_2nd_lighter").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            } else {
                Image("barbell").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().opacity(0.1)
            }
            
            VStack {
                Spacer()
                    List(categories.datas){i in

                        Text(i.name)

                    }
                    
                    Text("Gym Buddies!!")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                

//            categories.datas[0].name
            

                Spacer()
                
//                sportscourt.fill
                Image(systemName: "sportscourt")
                    .padding(.top)
                    .font(.system(size: 65, weight: .light))
                    
                
                Spacer()
                
//                just examples
                Button(action: {
                    print("Button action")
                }) {
                    Text("Create Account").font(.title).padding(30.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0))

                Spacer()

                Button(action: {
                    print("Button action")
                }) {
                    Text("Login with Google").font(.title).padding(30.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0))
                    
                Spacer()
            }
        }
        
        
    }
}
//struct ContentView: View {
//    var body: some View {
//        Home()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct Home : View {
//
//    @ObservedObject var categories = getCategoriesData()
//
//    var body : some View{
//

//        VStack{
//
//            List(categories.datas){i in
//
//                Text(i.name)
//
//
//            }
//        }
//    }
//}

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
