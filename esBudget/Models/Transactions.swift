//
//  Transactions.swift
//  esBudget
//
//  Created by Dre Price on 1/14/25.
//

import Foundation


struct Transactions: Identifiable{
    
    let id: UUID = .init()
    
    var title : String
    var comments : String
    var amount : Double
    var DateAdded : Date
    var category : String
   
    
    
    init(title: String, comments: String, amount: Double, DateAdded: Date, category: String) {
        self.title = title
        self.comments = comments
        self.amount = amount
        self.DateAdded = DateAdded
        self.category = category
       
    }
    
    
    
    
    
}
