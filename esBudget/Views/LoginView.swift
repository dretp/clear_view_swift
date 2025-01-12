    //
    //  ProfileView.swift
    //  esBudget
    //
    //  Created by Dre Price on 12/17/24.
    //

    import SwiftUI

    struct LoginView: View {
        @State var username = ""
        @State var pass = ""
        @State var showPassword: Bool = false
        @State private var user : Member?
        
        
        var isSignInButtonDisabled: Bool {
            [username, pass].contains(where: \.isEmpty)
        }
        var body: some View {
            
            // Header
            
            HeaderView()
            
            
            //Login Form
            
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                
                TextField("Name",
                          text: $username ,
                          prompt: Text("Login").foregroundColor(.blue)
                )
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2)
                }
                .padding(.horizontal)
                
                HStack {
                    Group {
                        if showPassword {
                            TextField("Password", // how to create a secure text field
                                      text: $pass,
                                      prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                        } else {
                            SecureField("Password", // how to create a secure text field
                                        text: $pass,
                                        prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                        }
                    }
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 2) // How to add rounded corner to a TextField and change it colour
                    }
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.red) // how to change image based in a State variable
                    }
                    
                }.padding(.horizontal)
                
                Spacer()
                
                Button {
                    
                    self.loginUser(userName: username, password: pass)
                    
                    
                } label: {
                    Text("Sign In")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
                .background(
                    isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                    LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                        LinearGradient(colors: [.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(20)
                .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
                .padding()
            }
            
            //Create Account
            
            VStack{
                Text("New Around Here")
                
                
                
            }
            .padding(.bottom,25)
            
            Spacer()
        }
        
        
        func loginUser(userName:String, password:String) {
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

        
        
        
        struct Member {
            let username : String
            let password : String
        }
    }



    #Preview {
        LoginView()
    }
