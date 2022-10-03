//
//  HomeView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI

struct HomeView: View {
    let showChances: Bool = false
    var body: some View {
        
        VStack (spacing: 20) {
            Text("Looking for the right summer program?")
                .font(.system(size: 25))
                .bold()
                .multilineTextAlignment(.center)
            Text("With dozens of resources online but no way to navigate them, we have compiled a list of prominent, well-recommended and selective summer programs. Enter your preferences and some details about you to return a personalised list of summer programs, ranked in order of how your profile your matches with the requirements of the program thus increasing the likelihood of your selection!")
                .padding(.horizontal)
                .font(.system(size: 15))
            Text("Featured Courses")
                .font(.system(size: 20))
                .bold()
            ProgramsView(studentStats: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], showChances: showChances, programs: Program.programs.filter { program in
                program.featured == true
            })
            NavigationLink (destination: MainView()) {
                Text("View other courses")
            }
        }
        .padding()
        .navigationTitle("Summer Programs")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
