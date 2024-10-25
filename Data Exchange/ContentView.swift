//
//  ContentView.swift
//  Data Exchange
//
//  Created by Mike Hall on 25/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var toText: String = ""
    var body: some View {
        VStack {
        HStack {
            TitledTextEditor(title: "From", value: $text)
            TitledTextEditor(title: "To", value: $toText)
        }
        .padding()
            HStack {
                MainButton(text: "Kotlin -> Swift"){
                    kToS()
                }
                MainButton(text: "Swift -> Kotlin"){
                    sToK()
                }
            }
        }.padding()
    }
    
    func kToS() {
        toText = text.replacingOccurrences(of: "data class", with: "struct")
            .replacingOccurrences(of: "(", with: ": Codable {")
            .replacingOccurrences(of: ")", with: "}")
            .replacingOccurrences(of: "val", with: "let")
            .replacingOccurrences(of: "ArrayList<", with: "[")
            .replacingOccurrences(of: "List<", with: "[")
            .replacingOccurrences(of: ">", with: "]")
            .replacingOccurrences(of: "Int", with: "Int32")
            .replacingOccurrences(of: "Long", with: "Int64")
            .replacingOccurrences(of: "Boolean", with: "Bool")
            .replacingOccurrences(of: ",\n", with: "\n")
    }
    
    func sToK() {
        toText = text.replacingOccurrences(of: "struct", with: "data class")
            .replacingOccurrences(of: ": Codable {", with: "(")
            .replacingOccurrences(of: "}", with: ")")
            .replacingOccurrences(of: "let", with: "val")
            .replacingOccurrences(of: "[", with: "ArrayList<")
            .replacingOccurrences(of: "]", with: ">")
            .replacingOccurrences(of: "Int32", with: "Int")
            .replacingOccurrences(of: "Int64", with: "Long")
            .replacingOccurrences(of: "Bool", with: "Boolean")
            .replacingOccurrences(of: "\n", with: ",\n")
            .replacingOccurrences(of: "(,", with: "(")
            .replacingOccurrences(of: ",\n,\n", with: "\n\n")
    }
}

#Preview {
    ContentView()
}
