//
//  PieChartSlice.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import Foundation
import SwiftUI

struct PieChartSlice:Hashable {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    var text:String
}
