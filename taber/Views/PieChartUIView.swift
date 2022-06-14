//
//  PieChartUIView.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI

struct PieChartSliceUIView: View {
    var slice: PieChartSlice
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
                }
        .aspectRatio(1, contentMode: .fit).padding()
    }
}

struct PieChartSliceUIView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSliceUIView(slice: PieChartSlice(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 30.0), color: Color.red)
        )
    }
}
