//
//  ButtonStyles.swift
//  Competency Cloud
//
//  Created by Mike Hall on 19/06/2023.
//

import SwiftUI
/**
 *
 * Buttons
 *
 * Common formatted buttons
 *
 */

/**
 *
 * MainButton
 *
 * Solid rounded corner button in the base colour with the standard inverse colour text
 *
 * Passes button text to analytics service
 *
 */

struct MainButton: View {
    let text: String
    var size: CGFloat = 14
    var fullWidth: Bool = false
    var height: CGFloat = 44
    var width: CGFloat? = nil
    var colour: Color = .blue
    var textColour: Color = .white
    let action: () -> Void
    var body: some View {
        Button(action:
                {action()}){
            HStack{
                HeaderText(text, size: size, colour: textColour)
                    .if(fullWidth){
                        $0.frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
                    }
                    .if(!fullWidth){
                        if let width {
                            $0.frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
                        } else {
                            $0.frame(minHeight: height, maxHeight: height)
                        }
                    }
            }.contentShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.horizontal, 20)
        .background(colour).cornerRadius(8)
    }
}

/**
 *
 * HoldableButton
 *
 * Solid rounded corner button in the base colour with the standard inverse colour text
 *
 * Passes button text to analytics service
 *
 */

struct HoldableButton: View {
    @Binding var isPressed: Bool
    let text: String
    var fullWidth: Bool = false
    var height: CGFloat = 34
    var width: CGFloat? = nil
    var colour: Color = .primary
    var textColour: Color = .white
    var onClick: (() -> Void)? = nil
    @GestureState private var isDetectingLongPress = false

    var body: some View {
        return HStack{
            HStack{
                if(fullWidth){
                    Spacer()
                }
                HeaderText(text, size: 14, colour: textColour)
                if(fullWidth){
                    Spacer()
                }
            }
        }
        .if(fullWidth){
            $0.frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
        }.if(!fullWidth){
            if let width {
                $0.frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
            } else {
                $0.frame(minHeight: height, maxHeight: height)
            }
        }
        .padding(.horizontal, 20)
        .background(colour).cornerRadius(8)
        .contentShape(RoundedRectangle(cornerRadius: 8))
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged{ _ in
                    isPressed = true
                }
                .onEnded{ _ in
                    isPressed = false
                    onClick?()
                }
        )
    }
}

/**
 *
 * MultiLineButton
 *
 * Solid rounded corner button in the base colour with the standard inverse colour text
 *
 * Text wraps to 'lines' number of lines
 *
 * Passes button text to analytics service
 *
 */
struct MultiLineButton: View {
    let text: String
    var fullWidth: Bool = false
    var lines: Int = 1
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }){
            HStack{
                VariableLineHeaderText(text: text, size: 12, colour: .white, lines: lines)
                    .if(fullWidth){
                        $0.frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
                    }
                    .if(!fullWidth){
                        $0.frame(height: CGFloat(lines * 16) + 12)
                    }
            }
            .contentShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.horizontal, 20)
        .background(.primary).cornerRadius(8)
    }
}

/**
 *
 * ContentButton
 *
 * Rounded corner button which uses the passed view as background
 *
 * Outlined with the Primary colour
 *
 * Passes 'buttonName' to analytics service
 *
 */

struct ContentButton<Content: View>: View {
    var colour: Color = .primary
    var fullWidth: Bool = false
    var lines: Int = 1
    var height: CGFloat? = nil
    var width: CGFloat? = nil
    var text: String
    let action: () -> Void
    @ViewBuilder var content: Content
    var body: some View {
        Button(action: {
            action()
        }){
            HStack{

                content.if(fullWidth){
                    $0.frame(maxWidth: .infinity)
                }

            }
            .contentShape(RoundedRectangle(cornerRadius: 8))
        }.if(height != nil){
            $0.frame(minHeight: height, maxHeight: height)
        }.if(width != nil){
            $0.frame(minWidth: width, maxWidth: width)
        }

        .background(colour).cornerRadius(8)
    }
}



struct TightButton: View {
    let text: String
    let size: CGFloat = 10
    var height: CGFloat = 24
    var width: CGFloat? = nil
    var colour: Color = .primary
    var textColour: Color = .white
    let action: () -> Void
    var body: some View {
        MainButton(text: text, size: size, height: height, width: width, colour: colour, textColour: textColour, action: action)
    }
}


struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TightButton(text: "Tight button", width: 80){}
            MainButton(text: "Primary Colour button"){}
            MainButton(text: "Primary Colour button", fullWidth: true){}
               ContentButton(text: "Test", action: {}){
                HStack{
                    Text("Hello").foregroundColor(.white)
                    Image(systemName: "cross.fill").foregroundColor(.white)
                }
            }
            ContentButton(height: 36, width: 36, text: "", action: {}){
                HStack{
                    Image(systemName: "trash.fill").foregroundColor(.white)
                }
            }
        }.padding(20)
    }
}
