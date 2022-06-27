//
//  api.swift
//  taber
//
//  Created by Karim Hassan on 27/06/2022.
//

import Foundation

class ExpensesApi {
    
    
}
func GetExpenses() async throws -> [Expense]{
    var request = URLRequest(url: URL(string: "https://tabber-backend.vercel.app/api/expenes")!,timeoutInterval: Double.infinity)

    request.httpMethod = "GET"
    let (data, response) = try await URLSession.shared.data(for: request)
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
    print(String(data: data, encoding: .utf8)!)
    let decodedFood = try JSONDecoder().decode([Expense].self, from: data)
    return decodedFood
}
