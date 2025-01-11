//
//  loginView.swift
//  esBudget
//
//  Created by Dre Price on 1/2/25.
//

import SwiftUI

struct loginView: View {
    @State var username = ""
    
    @State var  password = ""
    var body: some View {
        
        TextField("Enter your name", text: $username)
                    .multilineTextAlignment(.center)
        
        TextField("Enter your name", text: $password)
                    .multilineTextAlignment(.center)
        Button("print",action: {
            
            self.sendPostRequest(userName: username,password: password)
            print(username)
        })
    }
    
    
    func sendPostRequest(userName:String, password:String) {
            let url = URL(string: "http://localhost:4000/member/login")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        let json: [String:String] = ["username": username,"password": password]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                if let data = data {
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJSON = responseJSON as? [String: Any] {
                        print(responseJSON)
                    }
                }
            }.resume()
        }
    
}

#Preview {
    loginView()
}
