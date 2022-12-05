//
//  SignUpView.swift
//  Lecture_Vapor_Login
//
//  Created by Donghoon Bae on 2022/12/05.
//

import SwiftUI

struct SignUpView: View {
    var fetchLogin: FetchLogin = FetchLogin()
    @State var isSignUp: Bool?
    
    @State var userName: String = ""
    @State var userPw: String = ""
    @Binding var isSelected: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("SignUp").font(.title)
            Spacer()
            TextField("ID", text: $userName).textFieldStyle(.roundedBorder).padding()
            Spacer()
            SecureField("Password", text: $userPw).textFieldStyle(.roundedBorder).padding()
            Spacer()
            
            Button {
                Task {
                    isSignUp = try await fetchLogin.signUp(userName: userName, userPw: userPw)
                    if isSignUp == true {
                        isSelected.toggle()
                    }
                }
            } label: {
                Text("Sign Up").padding()
            }
            Spacer()
            if isSignUp == false {
                Text("Sign Up Failed!").padding()
                Spacer()
            }
        }
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView(isSelected: .constant(true))
//    }
//}
