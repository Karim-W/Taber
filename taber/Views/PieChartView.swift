//
//  PieChartView.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI

struct PieChartView: View {
    var expenses:[Expense]
    @State var Categories: [String: Double] = [:]
    let colors = [Color.blue,Color.green,Color.yellow,Color.orange,Color.red,Color.pink,Color.purple]
    @State var Total: Double = 0.0
    @State var slices:[PieChartSlice] = []
    @State var TEntries:[PieTableEntry] = []
    var body: some View {
        
        VStack{
            GeometryReader { geometry in
                       ZStack{
                           ForEach (slices,id: \.self){ s in
                               PieChartSliceUIView(slice: s)
                           }
                           Circle().fill(Color.white)
                               .frame(width: geometry.size.width * 0.50, height: geometry.size.width * 0.50)
                                VStack {
                                   Text("Total")
                                       .font(.title)
                                       .foregroundColor(Color.gray)
                                   Text(String(format: "%.1f", Total))
                                       .font(.title)
                               }
                       }

                   }
        }.onAppear {
            ComputeTotal()
        }
    }
    
    //MARK: Functions
    func ComputeTotal(){
        Total=0
    Categories = [:]
        
        for e in expenses{
            Total += e.Price
            if (Categories[e.Category] != nil){
                Categories[e.Category]! += e.Price
            }else{
                Categories[e.Category] = e.Price
            }
        }
        var index = 0
        var prevAng:Double = 0.0
        for (k, v) in Categories{
            let angleSize:Double = (v/Total) * 360
            let i = PieChartSlice(startAngle: Angle(degrees: prevAng), endAngle: Angle(degrees: prevAng+angleSize), color:colors[index],text: k)
            slices.append(i)
            index += 1
            prevAng=i.endAngle.degrees
        }
        print(slices)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(expenses: [
            Expense(Price: 320, PaymentDate: Date.now, Category: "String", Subject: "String", IsSubscription: false, Details: "String"),
            Expense(Price: 120, PaymentDate: Date.now, Category: "hehe", Subject: "String", IsSubscription: false, Details: "String"),
            Expense(Price: 120, PaymentDate: Date.now, Category: "hehue", Subject: "Stringo", IsSubscription: false, Details: "String"),
            Expense(Price: 120, PaymentDate: Date.now, Category: "hehe", Subject: "String", IsSubscription: false, Details: "String")
        ])
    }
}
