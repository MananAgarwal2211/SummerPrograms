//
//  DetailView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI

struct DetailView: View {
    var program: Program
    var body: some View {
        List {
            Section(header: Text("Course Info")) {
                HStack {
                    Text("Subject(s)")
                        .bold()
                    Spacer()
                    if (program.Subject.engineering) {
                        Text("Engineering ")
                    }
                    if (program.Subject.physical_sciences) {
                        Text("Physical Science ")
                    }
                    if (program.Subject.mathematics) {
                        Text("Mathematics ")
                    }
                    if (program.Subject.computer_science) {
                        Text("Computer Science ")
                    }
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Country")
                        .bold()
                    Spacer()
                    Text(program.country.rawValue)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Length (in weeks)")
                        .bold()
                    Spacer()
                    Text(String(program.length))
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Eligible grades")
                        .bold()
                    Spacer()
                    Text(commaSeparatedList(list: program.grade))
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Cost")
                        .bold()
                    Spacer()
                    Text("$ \(Int(program.cost))")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("2022 Dates")
                        .bold()
                    Spacer()
                    Text("\(months[program.date.start_month]) \(program.date.start_day) to \(months[program.date.end_month]) \(program.date.end_day)")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text(program.site.rawValue.capitalized)
                    if (program.needBasedAid) {
                        Spacer()
                        Text("Aid Per Need")
                    }
                    if (program.internationalAllowed) {
                        Spacer()
                        Text("Intl. Seats")
                    }
                    if (program.creditsGiven) {
                        Spacer()
                        Text("Credits")
                    }
                }
            }
            
            Section (header: Text("Admission Criteria")) {
                if program.entranceTest {
                    Text("Entrance Test")
                }
                if program.entranceRequirements[0] {
                    Text("Recommendation Letter")
                }
                if program.entranceRequirements[1] {
                    Text("Standardised Test")
                }
                if program.entranceRequirements[2] {
                    Text("Transcript")
                }
                if !(program.entranceTest || program.entranceRequirements[0] || program.entranceRequirements[1] || program.entranceRequirements[2]) {
                    Text("Not Available")
                }
            }
            
            Section (header: Text("Description")) {
                Text(program.description)
            }
            
            Section (header: Text("Website Link")) {
                Text(program.website)
            }
        }
        .navigationBarTitle(program.name, displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(program: Program.programs[0])
        }
    }
}

func commaSeparatedList(list: [Int]) -> String {
    var outputString: String = ""
    outputString.append(list.map{ "\(String($0))" }.joined(separator: ", "))
    return outputString
}

let months = ["buffer", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
