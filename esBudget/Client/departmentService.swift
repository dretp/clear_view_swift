//
//  departmentService.swift
//  esBudget
//
//  Created by Dre Price on 12/18/24.
//

import Foundation

struct departmentClient {
    
    
    func getDepartments() async throws -> [Department] {
        
        
                let endpoint = "http://localhost:4000/department/list"
                
                guard let url = URL(string: endpoint) else {
                    throw GHError.invalidURL
                }
                
                let (data, response) = try await URLSession.shared.data(from: url)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw GHError.invalidResponse
                }
                
        guard let departmentResp = try? JSONDecoder().decode(departmentResponse.self, from: data) else{
            throw GHError.invalidData
        }
        return departmentResp.result;
    }
    enum GHError : Error {
        case invalidURL
        case invalidResponse
        case invalidData
    }
}
