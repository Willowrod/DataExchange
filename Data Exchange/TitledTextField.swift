//
//  TitledTextField.swift
//  Competency Cloud
//
//  Created by Mike Hall on 19/06/2023.
//

import SwiftUI
/**
 *
 * TitledTextField
 *
 * Provides text input for different styles in app
 *
 */

struct TitledTextField: View {
    let title: String
    let value: Binding<String>
    var error: String? = nil
    var hint = ""
    var editAction: (() -> Void) = {}
    @State private var isSecured: Bool = true
    @State private var editing = false
    var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            SecondaryText(title, colour: .black)
            ZStack(alignment: .trailing){
                Group{
                        TextField("", text: value, onEditingChanged: {edit in
                            self.editing = edit
                            self.editAction()
                        })
                        .foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true)
                        
                    
                }.padding(.trailing, 40).background(.background).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(scoreColour(error: error), lineWidth: 1)
                )
                HStack{
                    if error != nil {
                        Image("ic_field_error").frame(width: 20, height: 20).padding(.trailing, 10)
                    }

                    if !value.wrappedValue.isEmpty {
                        Button(action: {
                            value.wrappedValue = ""
                        }) {
                            Image(systemName: "xmark.circle").resizable().frame(width: 20, height: 20).foregroundColor(.gray).padding(.trailing, 10)
                        }
                    }

                }
            }
            SecondaryText(errorOrHint(error: error, hint: hint), size: 12, colour: hintColour(error: error))

        }.padding(.horizontal, 20).padding(.bottom, 20).frame(maxWidth: .infinity, minHeight: 95, maxHeight: 95)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}


struct TitledTextEditor: View {
    let title: String?
    let value: Binding<String>
    var error: String? = nil
    var hint = ""
    var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            if let title {
                SecondaryText(title, colour: .white)
            }
            TextEditor(text: value).foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true).frame(maxWidth: .infinity, maxHeight: .infinity).cornerRadius(10).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(scoreColour(error: error), lineWidth: 1)
            )
            SecondaryText(errorOrHint(error: error, hint: hint), size: 12, colour: hintColour(error: error))
        }.padding(.horizontal, 20).padding(.bottom, 20).frame(width: 300, height: 700)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}



struct CustomTextFieldStyle: TextFieldStyle {
    @FocusState private var textFieldFocused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 10)
            .background(.white)
            .frame(height: 55)
            .focused($textFieldFocused)
            .onTapGesture {
                textFieldFocused = true
            }
    }
}


struct TitledTextField_Previews: PreviewProvider {
    @State static var value: String = "A Value"
    @State static var multilineValue: String = "A long value that might eventually bleed over a few lines, this is particularly for the address field........................ Maybe even on to 4 lines, who knows?"
    static var previews: some View {
        ScrollView{
            VStack(alignment: .leading) {
                TitledTextField(title: "Competency Cloud App", value: $value)
                TitledTextField(title: "Competency Cloud App With Error", value: $value, error: "Error")
                TitledTextField(title: "Competency Cloud App With Hint", value: $value, hint: "Hint")
                TitledTextEditor(title: "Competency Cloud App Multi Line", value: $multilineValue, error: "Error")
                TitledTextEditor(title: nil, value: $multilineValue, error: nil)
            }
        }.frame(maxWidth: .infinity).background(.white)
    }
}
