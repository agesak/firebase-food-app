//
//  ContentView.swift
//  swiftui-appdelegate
//
//  Created by Kareha on 1/26/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
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
        HomeView()
            
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
//    @ObservedObject var categories = getCategoriesData()
    
    var body: some View {

  
        ZStack {
            if colorScheme == .dark {
                Image("barbell_2nd_lighter").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            } else {
                Image("barbell").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().opacity(0.1)
            }
            
            VStack {
//                Spacer()
//                    List(categories.datas){i in
//
//                        Text(i.name)
//
//                    }
                
                Spacer()
                    
                    Text("Gym Buddies")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
            

                Spacer()
                
//                sportscourt.fill
                Image(systemName: "sportscourt")
                    .padding(.top)
                    .font(.system(size: 65, weight: .light))
                    
                
                Spacer()
                

                CreateAccount()

                Spacer().frame(height: 30)

                SignIn()
                    
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

//class getCategoriesData : ObservableObject {
//    @Published var datas = [category]()
//
//    init() {
//        let db = Firestore.firestore()
//
//        db.collection("categories").addSnapshotListener { (snap, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            for i in snap!.documentChanges{
//                let id = i.document.documentID
//                let name = i.document.get("name") as! String
//                let price = i.document.get("price") as! String
//
//                self.datas.append(category(id: id, name: name, price: price))
//            }
//        }
//    }
//}
//
//struct category : Identifiable {
//
//    var id : String
//    var name : String
//    var price : String
//}

struct CreateAccount: View {
    var body: some View {
        Button(action: {
            print("Button action")
        }) {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
              .frame(width: 250, height: 50)
//                for custom divide rbg by 255
                .background(Color.purple)
              .cornerRadius(10.0)
        }
    }
}

struct SignIn: View {
    var body: some View {
        Button(action: {
            print("Button action")
        }) {
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
              .frame(width: 250, height: 50)
//                for custom divide rbg by 255
                .background(Color.purple)
              .cornerRadius(10.0)
        }
        

    }
}
