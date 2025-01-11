//
//  departmentModel.swift
//  esBudget
//
//  Created by Dre Price on 12/18/24.
//

import Foundation


struct departmentResponse : Decodable {
    
    let result: [Department]
}

struct Department : Decodable, Identifiable {
    
    let id : String
    let name : String
    
    private enum CodingKeys: String, CodingKey{
        case id
        case name
    }
}
