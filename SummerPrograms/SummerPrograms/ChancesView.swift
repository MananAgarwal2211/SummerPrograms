//
//  ChancesView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 13/03/22.
//

import SwiftUI

struct ChancesView: View {
    
    @Binding var satTaken: Bool
    @Binding var satScore: Double
    @Binding var GPA: Double
    @Binding var mathExamTaken: Bool
    @Binding var mathExamExcelled: Bool
    @Binding var scienceExamTaken: Bool
    @Binding var scienceExamExcelled: Bool
    @Binding var scienceProjectCompleted: Bool
    @Binding var scienceProjectAwarded: Bool
    @Binding var researchPaperWritten: Bool
    @Binding var researchPaperPublished: Bool
    @Binding var goodRecommendation: Bool
    @Binding var ECAparticipation: Bool
    
//    $studentChances[1] = {
//        (Double(Int(SATScore) ?? 1000) - 400) / 1200
//    }
    
    var body: some View {
        Form {
            Section (header: Text("SAT")) {
                Toggle("Taken", isOn: $satTaken)
                if satTaken {
                    HStack {
                        Text("Score:")
                        Spacer()
                        Slider(value: $satScore, in: 400...1600, step: 10) {
                            Text("Length")
                        }
                        .accessibilityValue("\(Int(satScore))")
                        Spacer()
                        Text("\(Int(satScore))")
                            .accessibilityHidden(true)
                    }
                }
            }
            Section (header: Text("GPA")) {
                HStack {
                    Slider(value: $GPA, in: 0...4, step: 0.01) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(GPA))")
                    Spacer()
                    Text(String(GPA).prefix(4))
                        .accessibilityHidden(true)
                }
            }
            
            Section (header: Text("Exams")) {
                Toggle ("Competitive Math Exam?", isOn: $mathExamTaken)
                if mathExamTaken {
                    Toggle ("Placed in Top 10%?", isOn: $mathExamExcelled)
                }
                Toggle ("Competitive Science Exam?", isOn: $scienceExamTaken)
                if scienceExamTaken {
                    Toggle ("Placed in Top 10%?", isOn: $scienceExamExcelled)
                }
            }
            
            Section (header: Text("Others")) {
                Toggle ("Written an academic paper?", isOn: $researchPaperWritten)
                if researchPaperWritten {
                    Toggle ("Published it?", isOn: $researchPaperPublished)
                }
                Toggle ("Completed a science fair project?", isOn: $scienceProjectCompleted)
                if scienceProjectCompleted {
                    Toggle ("Received an award?", isOn: $scienceProjectAwarded)
                }
                Toggle ("Likely to get a good recommendation?", isOn: $goodRecommendation)
                Toggle ("Good extracurricular participation", isOn: $ECAparticipation)
            }
        }
    }
}

struct ChancesView_Previews: PreviewProvider {
    static var previews: some View {
        ChancesView(satTaken: .constant(Program.someBoolean1), satScore: .constant(Program.double1), GPA: .constant(Program.double1), mathExamTaken: .constant(Program.someBoolean1), mathExamExcelled: .constant(Program.someBoolean1), scienceExamTaken: .constant(Program.someBoolean1), scienceExamExcelled: .constant(Program.someBoolean1), scienceProjectCompleted: .constant(Program.someBoolean1), scienceProjectAwarded: .constant(Program.someBoolean1), researchPaperWritten: .constant(Program.someBoolean1), researchPaperPublished: .constant(Program.someBoolean1), goodRecommendation: .constant(Program.someBoolean1), ECAparticipation: .constant(Program.someBoolean1))
    }
}

