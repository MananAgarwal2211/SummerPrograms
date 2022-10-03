//
//  MainView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI

struct MainView: View {
    @State var engineering = true
    @State var physical_sciences = true
    @State var mathematics = true
    @State var computer_science = true
    @State var max_cost = 10000.00
    @State var min_time = 0.0
    @State var max_time = 10.0
    @State var grade = ""
    @State var international = false
    
    @State var showChances = false
    @State var satTaken = false
    @State var satScore = 0.0
    @State var GPA = 0.0
    @State var mathExamTaken = false
    @State var mathExamExcelled = false
    @State var scienceExamTaken = false
    @State var scienceExamExcelled = false
    @State var scienceProjectCompleted = false
    @State var scienceProjectAwarded = false
    @State var researchPaperWritten = false
    @State var researchPaperPublished = false
    @State var goodRecommendation = false
    @State var ECAparticipation = false
    
    @State private var isPresentingShortlistView = false
    @State private var isPresentingChancesView = false
    
    var body: some View {
        ProgramsView(studentStats: Program.statsArray(satTaken: satTaken, satScore: satScore, GPA: GPA, mathExamTaken: mathExamTaken, mathExamExcelled: mathExamExcelled, scienceExamTaken: scienceExamTaken, scienceExamExcelled: scienceExamExcelled, scienceProjectCompleted: scienceProjectCompleted, scienceProjectAwarded: scienceProjectAwarded, researchPaperWritten: researchPaperWritten, researchPaperPublished: researchPaperPublished, goodRecommendation: goodRecommendation, ECAparticipation: ECAparticipation), showChances: showChances, programs: Program.programs.filter { program in
            ((program.Subject.engineering && engineering) || (program.Subject.physical_sciences && physical_sciences) || (program.Subject.mathematics && mathematics) || (program.Subject.computer_science && computer_science)) && (program.cost <= Int(max_cost)) && (program.length >= Int(min_time)) && (program.length <= Int(max_time)) && (program.grade.contains(Int(grade) ?? 10))
        })
        .navigationTitle("Courses")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Filter") {
                    isPresentingShortlistView = true
                }
                Spacer()
                Button("Check your chances") {
                    isPresentingChancesView = true
                    showChances = true
                }
            }
        }
        .sheet(isPresented: $isPresentingShortlistView) {
            NavigationView {
                ShortlistView (engineering: $engineering, physical_sciences: $physical_sciences, mathematics: $mathematics, computer_science: $computer_science, max_cost: $max_cost, min_time: $min_time, max_time: $max_time, grade: $grade, international: $international)
                    .navigationTitle("Filter Courses")
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingShortlistView = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresentingChancesView) {
            NavigationView {
                ChancesView (satTaken: $satTaken, satScore: $satScore, GPA: $GPA, mathExamTaken: $mathExamTaken, mathExamExcelled: $mathExamExcelled, scienceExamTaken: $scienceExamTaken, scienceExamExcelled: $scienceExamExcelled, scienceProjectCompleted: $scienceProjectCompleted, scienceProjectAwarded: $scienceProjectAwarded, researchPaperWritten: $researchPaperWritten, researchPaperPublished: $researchPaperPublished, goodRecommendation: $goodRecommendation, ECAparticipation: $ECAparticipation)
                    .navigationTitle("Check Chances")
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingChancesView = false
                            }
                        }
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
