//
//  HeaderView.swift
//  esBudget
//
//  Created by Dre Price on 1/2/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: 15))
                    
                    
                    VStack{
                        Text("Welcome to Emsite Budget")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .bold()
                        
                        Text("Signup")
                            .foregroundColor(.black)
                    }
                    .padding(.top,30)
                }
                
                .frame(width: UIScreen.main.bounds.width * 3, height: 300)
                .offset(y:-105)
                
                
                Spacer()
    }
}

#Preview {
    HeaderView()
}
