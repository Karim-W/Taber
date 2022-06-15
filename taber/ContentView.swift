//
//  ContentView.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.init(red: 15/255, green: 118/255, blue: 110/255)
            HStack{
                PieChartView(expenses: [
                    Expense(Price: 300, PaymentDate: Date.now, Category: "Rent", Subject: "String", IsSubscription: false, Details: "String"),
                    Expense(Price: 120, PaymentDate: Date.now, Category: "Transport", Subject: "String", IsSubscription: false, Details: "String"),
                    Expense(Price: 120, PaymentDate: Date.now, Category: "Transport", Subject: "Stringo", IsSubscription: false, Details: "String"),
                    Expense(Price: 120, PaymentDate: Date.now, Category: "Food", Subject: "String", IsSubscription: false, Details: "String"),
                    Expense(Price: 190, PaymentDate: Date.now, Category: "Fees", Subject: "String", IsSubscription: false, Details: "String"),
                    Expense(Price: 90, PaymentDate: Date.now, Category: "Cable", Subject: "String", IsSubscription: false, Details: "String")
                ])
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//extension Color {
//    init(red: Int, green: Int, blue: Int) {
//       assert(red >= 0 && red <= 255, "Invalid red component")
//       assert(green >= 0 && green <= 255, "Invalid green component")
//       assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//   }
//
//   init(rgb: Int) {
//       self.init(
//           red: (rgb >> 16) & 0xFF,
//           green: (rgb >> 8) & 0xFF,
//           blue: rgb & 0xFF
//       )
//   }
//}
