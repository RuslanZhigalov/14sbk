//
//  ChartsSchedule.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 24.05.2023.
//

import SwiftUI
import Charts
import Foundation
struct SavingCharts: View {
    var data1: [Money]
    init(data1: [Money]) {
        self.data1 = data1
    }
    var body: some View {
        Chart(data1, id: \.title) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sunshine", $0.title)
            )
        }
    }
}
