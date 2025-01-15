//
//  exampleView.swift
//  esBudget
//
//  Created by Dre Price on 1/14/25.
//

import SwiftUI


struct exampleView: View {
    struct MenuItem: Identifiable {
        let id = UUID()
        let name: String
        let price: Double
        let thumbnailImage: String
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    exampleView()
}
