//
//  CardView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI

struct CardView: View {
    let studentStats: [Double]
    let program: Program
    let showChances: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text(program.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(program.location[0])", systemImage: "location")
                    .accessibilityLabel("Located at \(program.location[0])")
                    .lineLimit(1)
                
                Spacer()
            }
            .font(.caption)
            HStack{
                Label("\(program.description)", systemImage: "book")
                    .accessibilityLabel(program.description)
                    .lineLimit(3)
                Spacer()
            }
            .font(.caption)
            if showChances {
                HStack {
                    Label(String(program.generateChance(studentStats: studentStats)).prefix(4) + "%", systemImage: "percent")
                        .accessibilityLabel("Located at \(program.location[0])")
                    Spacer()
                }
                .font(.caption)
            }
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var program = Program.programs[0]
    static var previews: some View {
        CardView(studentStats: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], program: program, showChances: true)
            .background(.white)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
