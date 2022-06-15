//
//  PieChartLegend.swift
//  taber
//
//  Created by Karim Hassan on 15/06/2022.
//

import SwiftUI

struct PieChartLegend: View {
    var items:[PieTableEntry]
    var body: some View {
        VStack{
            ForEach (items,id: \.self){ item in
                HStack{
                    Text(item.name)
                    Spacer()
                    HStack{
                        Text(String(format: "%0.1f", item.percentage*100)+"%")
                        RoundedRectangle(cornerRadius: 5).frame(width: 16, height: 16).foregroundColor(item.color)
                    }
                    
                }.padding(.horizontal)
                Divider().frame( height: 2).overlay(.white)
            }
        }
    }
}

struct PieChartLegend_Previews: PreviewProvider {
    static var previews: some View {
        PieChartLegend(items: [
            PieTableEntry(name: "Rent", percentage: 0.12, color: Color.orange),
            PieTableEntry(name: "Food", percentage: 0.62, color: Color.red),
            PieTableEntry(name: "Transport", percentage: 0.62, color: Color.blue)
        ])
    }
}
