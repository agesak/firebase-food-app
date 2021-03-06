//
//  ContentView.swift
//  swiftui-appdelegate
//
//  Created by Kareha on 1/26/21.
//

import SwiftUI
import Firebase


struct HomeView : View {
    
    var body : some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}

struct MainView : View {
    
    var body : some View {
        VStack {
            Spacer()
            AppName()
            Spacer()
            AppLogo()
            Spacer()
            
            SignUp()
//            Button(action: {
//                print("Sign Up")
////                withAnimation {
////                    self.signUp.toggle()}
//            }) {
//                Text("Sign Up")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//                  .frame(width: 250, height: 50)
//    //                for custom divide rbg by 255
//                    .background(Color.purple)
//                  .cornerRadius(10.0)
//            }
         
            SignIn()
        }
    }
}



//struct HomeView: View {
//    @State var showMenu = false
//    @State var signUp = false
//
//    var body: some View {
//
//        return NavigationView {
//
//
//            GeometryReader { geometry in
//                ZStack(alignment: .leading) {
//                    MainView(showMenu: self.$showMenu, signUp: self.$signUp)
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
//                        .disabled(self.showMenu ? true : false)
//                    if self.showMenu {
//                        MenuView()
//                            .frame(width: geometry.size.width/2)
//                            .transition(.move(edge: .leading))
//                    }
//                    if self.signUp {
//                        UserView()
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                    }
//                }
//            }
//            .navigationBarItems(leading: (
//                                Button(action: {
//                                    withAnimation {
//                                        self.showMenu.toggle()
//                                    }
//                                }) {
//                                    Image(systemName: "line.horizontal.3")
//                                        .imageScale(.large)
//                                }
//                            ))
//            }
//        }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//
//    }
//}

//struct MainView: View {
//
//    @Binding var showMenu: Bool
//    @Binding var signUp: Bool
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
//
//    var body: some View {
//
//
//        ZStack {
//            if colorScheme == .dark {
//                Image("barbell_2nd_lighter").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
//            } else {
//                Image("barbell").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().opacity(0.1)
//            }
//
//            VStack {
//                Spacer()
//                AppName()
//                Spacer()
//                AppLogo()
//                Spacer()
//
////                cant figure out how to make function work
////                CreateAccount()
//                Button(action: {
//                    withAnimation {
//                        self.signUp.toggle()}
//                }) {
//                    Text("Sign Up")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .padding()
//                      .frame(width: 250, height: 50)
//        //                for custom divide rbg by 255
//                        .background(Color.purple)
//                      .cornerRadius(10.0)
//                }
//                Spacer().frame(height: 30)
//                SignIn()
//                Spacer()
//            }
//        }
//    }
//}


struct SignUp: View {

//    var signUp: Bool
    
    @State var signUp = false

    var body: some View {
        Button(action: {
//            print("Sign Up")
            withAnimation {
                self.signUp.toggle()
                
                if signUp {
                    print("signed up")
                } else {
                    print("not signed up")
                }
                
            }
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

struct AppName: View {
    var body: some View {
        Text("Gym Buddies")
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
    }
}

struct AppLogo: View {
    var body: some View {
        //                sportscourt.fill
        Image(systemName: "sportscourt")
            .padding(.top)
            .font(.system(size: 65, weight: .light))
    }
}
