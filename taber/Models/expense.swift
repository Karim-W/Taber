//
//  expense.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import Foundation

//struct Expense:Decodable {
////    var id: String
//    var Price:Double
//    var PaymentDate:Date
//    var Category:String
//    var Subject:String
//    var IsSubscription:Bool
//    var Details:String
//}
struct Expense: Codable,Hashable {
    let id: String
    let price: Double
    let paymentDate, category, subject: String
    let isSubscription: Bool
    let details: String

    enum CodingKeys: String, CodingKey {
        case id
        case price = "Price"
        case paymentDate = "PaymentDate"
        case category = "Category"
        case subject = "Subject"
        case isSubscription = "IsSubscription"
        case details = "Details"
    }
}

