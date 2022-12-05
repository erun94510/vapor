//
//  ContentView.swift
//  Lecture_Vapor_Login
//
//  Created by Donghoon Bae on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    
    var fetchLogin: FetchLogin = FetchLogin()
    @State var isLogin: Bool?
    
    @State var userName: String = ""
    @State var userPw: String = ""
    @State var isSelected: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                TextField("ID", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                SecureField("Password", text: $userPw)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                HStack {
                    Button {
                        Task {
                            isLogin = try await fetchLogin.fetchData(userName: userName, userPw: userPw)
                        }
                    } label: {
                        Text("Login")
                            .padding()
                    }
                    
                    Button {
                        isSelected = true
                    } label: {
                        Text("Sign Up")
                    }.sheet(isPresented: $isSelected, onDismiss: diddismiss) {
                        SignUpView(isSelected: $isSelected)
                            .presentationDetents([.medium])
                    }
                }
                
                if isLogin == true {
                    Text("Login!").padding()
                } else if isLogin == false {
                    Text("Login Failed").padding()
                }
            }
            .padding()
            .navigationTitle("LoginPage")
        }
    }
    
    func diddismiss() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
