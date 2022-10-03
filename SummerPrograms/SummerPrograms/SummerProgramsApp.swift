//
//  SummerProgramsApp.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 09/03/22.
//

import SwiftUI

@main
struct SummerProgramsApp: App {
    private var programs = Program.programs
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
        }
    }
}
