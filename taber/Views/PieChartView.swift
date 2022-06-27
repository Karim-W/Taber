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
    let colors = [
        Color.init(hex: "#9f1239")!,
//        Color.init(hex: "#9d174d")!,
        Color.init(hex: "#86198f")!,
//        Color.init(hex: "#6b21a8")!,
        Color.init(hex: "#5b21b6")!,
//        Color.init(hex: "#3730a3")!,
        Color.init(hex: "#1e40af")!,
//        Color.init(hex: "#075985")!,
        Color.init(hex: "#155e75")!,
//        Color.init(hex: "#115e59")!,
        Color.init(hex: "#065f46")!,
//        Color.init(hex: "#166534")!,
        Color.init(hex: "#3f6212")!,
//        Color.init(hex: "#854d0e")!,
        Color.init(hex: "#92400e")!,
        Color.init(hex: "#9a3412")!,
    ]
    @State var Total: Double = 0.0
    @State var slices:[PieChartSlice] = []
    @State var TEntries:[PieTableEntry] = []
    var body: some View {
        
        VStack{
            HStack{
                Spacer(minLength: 30)//ik this is bad, idk with so skewed
                GeometryReader { geometry in
                    ZStack{
                        ForEach (slices,id: \.self){ s in
                            PieChartSliceUIView(slice: s)
                        }
                        Circle().fill(Color.init(hex: "#27272a")!)
                            .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                        VStack {
                            Text("Total")
                                .font(.title)
                                .foregroundColor(Color.gray)
                            
                            Text(String(format: "%.1f", Total))
                                .font(.title)
                            Text("AED")
                        }
                    }
                }
                
            }
            PieChartLegend(items: TEntries)
        }.onAppear {
            ComputeTotal()
        }.edgesIgnoringSafeArea(.all)
    }
    
    //MARK: Functions
    func ComputeTotal(){
        Total=0
        Categories = [:]
        
        for e in expenses{
            Total += e.price
            if (Categories[e.category] != nil){
                Categories[e.category]! += e.price
            }else{
                Categories[e.category] = e.price
            }
        }
        var index = 0
        var prevAng:Double = 0.0
        for (k, v) in Categories{
            let angleSize:Double = (v/Total) * 360
            let i = PieChartSlice(startAngle: Angle(degrees: prevAng), endAngle: Angle(degrees: prevAng+angleSize), color:colors[index],text: k)
            let ii = PieTableEntry(name: k, percentage: v/Total, color: colors[index])
            slices.append(i)
            TEntries.append(ii)
            index += 1
            prevAng=i.endAngle.degrees
        }
        TEntries = TEntries.sorted(by: { l, r in
            return l.percentage > r.percentage
        })
        slices = slices.sorted { l, r in
            return l.text > r.text
        }
        print(slices)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(expenses: [
            
        ])
        .preferredColorScheme(.dark)
    }
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
