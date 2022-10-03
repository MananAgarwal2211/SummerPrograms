//
//  ProgramsView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI


struct ProgramsView: View {
    let studentStats: [Double]
    let showChances: Bool
    let programs: [Program]
    
    var body: some View {
        List {
            ForEach(programs) { program in
                NavigationLink(destination: DetailView(program: program)) {
                    CardView(studentStats: studentStats, program: program, showChances: showChances)
                }
            }
        }
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProgramsView(studentStats: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], showChances: false, programs: Program.programs)
        }
    }
}
