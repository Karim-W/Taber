//
//  SQLite.swift
//  taber
//
//  Created by Karim Hassan on 16/06/2022.
//

import Foundation
import SQLite

class DB{
    var _db:Connection?
    var _expenses:Table?
    let id = Expression<Int64>("id")
    let Sub = Expression<String>("Subject")
    let Category = Expression<String>("Category")
    let IsSubscription = Expression<Bool>("IsSubbed")
    let PaymentDate = Expression<Date>("PaymentDate")
    let Details = Expression<String>("Details")
    let price = Expression<Double>("Price")

    init(){
        do{
            let fileURL = try FileManager.default
                   .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent("db.sqlite3")
            self._db = try Connection(fileURL.path)
            let Expenses = Table("expenses")
            self._expenses = Expenses
            try _db!.run(Expenses.create { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(Category)
                t.column(Sub)
                t.column(IsSubscription)
                t.column(PaymentDate)
                t.column(Details)
                t.column(price)
            })
        }catch{
            print("Could not open Database")
            self._db = nil
            self._expenses = nil
        }
    }

    func FetchExpenses() -> [Expense] {
        do {
            let fileURL = try FileManager.default
                   .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent("db.sqlite3")
            self._db = try Connection(fileURL.path)
            let Expenses = Table("expenses")
            self._expenses = Expenses
			let timeAtBeginingOfTheDay = Calendar.current.startOfDay(for: Date())
			let timeAtBeginingOfTheMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: timeAtBeginingOfTheDay))
			let timeAtTheEndOfTheMonth = Calendar.current.date(byAdding: .month, value: 1, to: timeAtBeginingOfTheMonth!)
            let stmt = try self._db!.prepare("SELECT * FROM expenses")
            for row in stmt {
                for (index, name) in stmt.columnNames.enumerated() {
                    print ("\(name):\(row[index]!)")
                    // id: Optional(1), email: Optional("alice@mac.com")
                }
            }        }catch{
            print("failed to fetch users")
        }
        return []
    }
}
