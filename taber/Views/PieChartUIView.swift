//
//  PieChartUIView.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI

struct PieChartSliceUIView: View {
    var slice: PieChartSlice
    var midRadians: Double {
        return Double.pi / 2.0 - (slice.startAngle + slice.endAngle).radians / 2.0
    }
    var Percentage:Double {
        let diff:Double = slice.endAngle.degrees - slice.startAngle.degrees
        let percent:Double = diff / 360
        return percent * 100
    }
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let center = CGPoint(x: width * 0.5, y: height * 0.5)
                path.move(to: center)
                path.addArc(
                    center: center,
                    radius: width * 0.5,
                    startAngle: Angle(degrees: -90.0) + slice.startAngle,
                    endAngle: Angle(degrees: -90.0) + slice.endAngle,
                    clockwise: false)
            }
            .fill(slice.color)
            VStack{
                if (Percentage > 10){
                    Text(slice.text).foregroundColor(.white)
                }
                
                Text(String(format: "%.1f", Percentage)+"%").foregroundColor(.white)
                
            }.position(
                x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
            )
            .foregroundColor(Color.black)
        }
        .aspectRatio(1, contentMode: .fit).padding()
    }
}

struct PieChartSliceUIView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSliceUIView(slice: PieChartSlice(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 40.0), color: Color.red,text: "Vibes")
        )
    }
}
