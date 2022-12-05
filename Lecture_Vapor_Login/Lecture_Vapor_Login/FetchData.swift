//
//  FetchData.swift
//  Lecture_Vapor_Login
//
//  Created by Donghoon Bae on 2022/12/05.
//

import Foundation

class FetchLogin {
    func fetchData(userName: String, userPw: String) async throws -> Bool {
        
        guard let url = URL(string: "http://127.0.0.1:8080/login/\(userName)/\(userPw)") else { return false }
        let (data, _) = try await URLSession.shared.data(from: url)
        let showingData = String(data: data, encoding: .utf8)!
        print(showingData)
        
        if showingData == "true" {
            return true
        } else {
            return false
        }
    }
    
    func signUp(userName: String, userPw: String) async throws -> Bool {
        
        guard let url = URL(string: "http://127.0.0.1:8080/signup/\(userName)/\(userPw)") else { return false }
        let (data, _) = try await URLSession.shared.data(from: url)
        let showingData = String(data: data, encoding: .utf8)!
        print(showingData)
        
        if showingData == "true" {
            return true
        } else {
            return false
        }

    }
}
