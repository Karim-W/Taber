//
//  ExpensesLogs.swift
//  taber
//
//  Created by Karim Hassan on 27/06/2022.
//

import SwiftUI

struct ExpensesLogs: View {
    @State var expenses:[Expense]
    var body: some View {
        ScrollView{
            VStack{
                ForEach (expenses, id: \.self){ item in
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text(item.subject)
                            Text("Category: "+item.category)
                            Text(item.paymentDate)
                        }
                        Spacer()
                        HStack(alignment: .center){
                            Text(String(format: "%0.1f", item.price) + " AED")
                        }
                        
                        if(item.isSubscription){
                            Spacer()
                            ZStack{
                                Circle().frame(width: 50).foregroundColor(Color.init(hex: "#047857"))
                                Text("Sub").foregroundColor(.white)
                            }
                        }
                        
                    }.padding()
                    Divider().frame( height: 2).overlay(Color.init(hex: "#3f3f46"))
                    
                }
            }
        }
    }
}

struct ExpensesLogs_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesLogs(expenses: [Expense(id: "1", price: 10.0, paymentDate: "Date.now", category: "dsa", subject: "sub", isSubscription: true, details: "dsad")])
    }
}
