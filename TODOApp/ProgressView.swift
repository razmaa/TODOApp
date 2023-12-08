//
//  ProgressView.swift
//  TODOApp
//
//  Created by nika razmadze on 08.12.23.
//

import SwiftUI

struct ProgressView: View {
    var value: Double
    var total: Double

    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Daily Tasks")
                .font(.system(size: 22))
                .foregroundStyle(.white)
                .padding()
            
            Text("\(Int(value))/\(Int(total)) Completed Tasks")
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding(.horizontal)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 20)
                        .foregroundColor(.gray)
                        .cornerRadius(8)

                    Rectangle()
                        .frame(width: CGFloat(value / total) * geometry.size.width, height: 20)
                        .foregroundColor(.purple)
                        .cornerRadius(8)

                    Text(String(format: "%.0f%%", (value / total) * 100))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                }
            }
            .frame(height: 20)
            .padding()
        }
        .background(Color(red: 0.24, green: 0.24, blue: 0.24))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}


#Preview {
    ProgressView(value: 50.0, total: 100)
}
