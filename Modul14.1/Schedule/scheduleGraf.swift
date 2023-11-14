//
//  scheduleGraf.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 24.05.2023.
//

import SwiftUI
import Charts
import Foundation

    struct SavingCharts: View {
        var monthlyList: [Money] = []
        @State var selectTab = "Weekday"
        var tabs = ["Неделя", "Месяц", "Квартал", "Все"]
        var body: some View {
            
            VStack(alignment: .leading) {
                
                ScrollView {
                    Picker("", selection: $selectTab) {
                        ForEach(tabs, id: \ .self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(24)
                }
            }
            Chart(monthlyList, id: \.date) {
                
                LineMark(
                    x: .value("Month", $0.date),
                    y: .value("Amount", $0.title)
                )
                .foregroundStyle(by: .value("Finance", $0.date))
                .interpolationMethod(.cardinal)
                
                
                
            }.chartYAxis() {
                AxisMarks(position: .leading)
            }
            .chartYScale(domain: 0...30000)
            .frame(width: 375, height: 367)
        }
    }
