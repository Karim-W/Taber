//
//  ContentView.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack{
            ZStack{
                Rectangle().foregroundColor(Color(UIColor.systemIndigo)).shadow(color: .red, radius: 5, x: .infinity, y: .infinity)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Taber").fontWeight(.light).font(.largeTitle).foregroundColor(Color.black)
                        Spacer()
                    }.padding(.bottom)
                }
            }.frame(width: .infinity, height: 100.0)
            PieChartView(expenses: [
                Expense(Price: 300, PaymentDate: Date.now, Category: "Rent", Subject: "String", IsSubscription: false, Details: "String"),
                Expense(Price: 120, PaymentDate: Date.now, Category: "Transport", Subject: "String", IsSubscription: false, Details: "String"),
                Expense(Price: 120, PaymentDate: Date.now, Category: "Transport", Subject: "Stringo", IsSubscription: false, Details: "String"),
                Expense(Price: 120, PaymentDate: Date.now, Category: "Food", Subject: "String", IsSubscription: false, Details: "String")
            ])
        }.edgesIgnoringSafeArea(.all)
       
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
