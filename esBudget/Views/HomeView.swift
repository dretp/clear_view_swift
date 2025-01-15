//
//  HomeView.swift
//  esBudget
//
//  Created by Dre Price on 1/14/25.
//

import SwiftUI
import SwiftData


struct ExpenseRowView: View {
    var item: Transactions

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text((item.category))
                    .font(.subheadline)
                Text(item.comments)
                    .font(.subheadline)
                Text(item.amount,format: .number)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct HomeView: View {
    // List of Expenses

    
    var body: some View {
        
        
        let expenses = [
            Transactions(title: "apple", comments: "labtop", amount: 2000, DateAdded: Date.now, category: "IT" ),
            Transactions(title: "windows", comments: "desktop", amount: 1003, DateAdded: Date.now, category: "IT" ),
            Transactions(title: "Unix", comments: "labtop", amount: 1500, DateAdded: Date.now, category: "IT" )
        ]
        
        //HeaderView
        
        
        
        //
        NavigationStack{
            
            List(expenses){ Transactions in
                ExpenseRowView(item: Transactions)
                
            }
            .navigationTitle("Expenses")
            
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        
                    }
                    label:{
                        Image(systemName: "plus.circle.fill")
                            
                    }
                }
            }
        }
        
        
        
        
        //tabView
        bottomTabView()
    }
}

#Preview {
    HomeView()
}
