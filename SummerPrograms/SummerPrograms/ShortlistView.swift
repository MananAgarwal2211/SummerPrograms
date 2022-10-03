//
//  ShortlistView.swift
//  SummerPrograms
//
//  Created by Manan Agarwal on 11/03/22.
//

import SwiftUI

struct ShortlistView: View {
    @Binding var engineering: Bool
    @Binding var physical_sciences: Bool
    @Binding var mathematics: Bool
    @Binding var computer_science: Bool
    @Binding var max_cost: Double
    @Binding var min_time: Double
    @Binding var max_time: Double
    @Binding var grade: String
    @Binding var international: Bool
    var body: some View {
        Form {
            Section (header: Text("Subjects")) {
                Toggle(isOn: $engineering) {
                    Text("Engineering?")
                }
                Toggle(isOn: $physical_sciences) {
                    Text("Physical Sciences?")
                }
                Toggle(isOn: $mathematics) {
                    Text("Mathematics?")
                }
                Toggle(isOn: $computer_science) {
                    Text("Computer Science?")
                }
            }
            
            Section (header: Text("Maximum Cost")) {
                HStack {
                    Slider(value: $max_cost, in: 1000...10000, step: 100) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(max_cost)) minutes")
                    Spacer()
                    Text("$ \(Int(max_cost))")
                        .accessibilityHidden(true)
                }
            }
            
            Section (header: Text("Course Length")) {
                HStack {
                    Slider(value: $min_time, in: 0...10, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(min_time)) minutes")
                    Spacer()
                    Text("\(Int(min_time)) weeks")
                        .accessibilityHidden(true)
                }
                HStack {
                    Slider(value: $max_time, in: 0...10, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(max_time)) minutes")
                    Spacer()
                    Text("\(Int(max_time)) weeks")
                        .accessibilityHidden(true)
                }
            }
            
            Section (header: Text("Your Info")) {
                HStack {
                    Text("Grade:")
                    Spacer()
                    TextField("Grade", text: $grade)
                        .keyboardType(.numberPad)
                }
                Toggle(isOn: $international) {
                    Text("International Student?")
                }
            }
        }
    }
}

struct ShortlistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShortlistView(engineering: .constant(Program.someBoolean1), physical_sciences: .constant(Program.someBoolean1), mathematics: .constant(Program.someBoolean1), computer_science: .constant(Program.someBoolean1), max_cost: .constant(Program.double3), min_time: .constant(Program.double1), max_time: .constant(Program.double2), grade: .constant(Program.someString), international: .constant(Program.someBoolean2))
        }
    }
}
