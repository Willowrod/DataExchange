//
//  TextStyles.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import SwiftUI

/**
 *
 * Texts
 *
 * Styled text views to give a uniform appearance to app text
 *
 */

/**
 *
 * HeaderText
 *
 * 18pt BOLD text used for text headers and buttons
 *
 * Text is shrinkable and multi line enabled
 *
 */

public struct HeaderText: View {
    public init(_ text: String, size: CGFloat = 18, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 18
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align)
    }
}

public struct SingleLineHeaderText: View {
    public init(text: String, size: CGFloat = 18, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 18
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).minimumScaleFactor(0.01).lineLimit(1)
    }
}

public struct VariableLineHeaderText: View {
    public init(text: String, size: CGFloat = 18, align: TextAlignment = .center, colour: Color = .black, lines: Int) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
        self.lines = lines
    }
    let text: String
    var size: CGFloat = 18
    var align: TextAlignment = .center
    var colour: Color = .black
    var lines: Int = 1
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).minimumScaleFactor(0.01).lineLimit(lines)
    }
}

/**
 *
 * BodyText
 *
 * 14pt MEDIUM weight text used for general text in app
 *
 */

public struct BodyText: View {
    public init(text: String, size: CGFloat = 14, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 14
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align)
    }
}

public struct SingleLineBodyText: View {
    public init(text: String, size: CGFloat = 14, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 14
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).minimumScaleFactor(0.01).lineLimit(1)
    }
}

public struct VariableLineBodyText: View {
    public init(text: String, size: CGFloat = 14, align: TextAlignment = .center, colour: Color = .black, lines: Int) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
        self.lines = lines
    }
    let text: String
    var size: CGFloat = 14
    var align: TextAlignment = .center
    var colour: Color = .black
    var lines: Int = 1
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).minimumScaleFactor(0.01).lineLimit(lines)
    }
}


public struct OptionalText: View {
    public init(text: String?, size: CGFloat = 14, align: TextAlignment = .center, colour: Color = .black, action: (() -> Void)?) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
        self.action = action
    }
    let text: String?
    var size: CGFloat = 14
    var align: TextAlignment = .center
    var colour: Color = .black
    var action: (() -> Void)? = nil
    public var body: some View {
        if let text, !text.isEmpty {
            return AnyView(Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).tappable(action))
        }
        return AnyView(ZStack{}.frame(width: 1, height: 1))
    }
}

public struct SpacedBodyText: View {
    public init(text: String, size: CGFloat = 14, spacing: CGFloat = 2, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.spacing = spacing
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 14
    var spacing: CGFloat = 2
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).lineSpacing(spacing)
    }
}

/**
 *
 * SecondaryText
 *
 * 14pt MEDIUM weight text used for general text in app
 *
 * Text is shrinkable and multi line enabled
 *
 */

public struct SecondaryText: View {
    public init(_ text: String, size: CGFloat = 14, align: TextAlignment = .center, colour: Color = .black) {
        self.text = text
        self.size = size
        self.align = align
        self.colour = colour
    }
    let text: String
    var size: CGFloat = 14
    var align: TextAlignment = .center
    var colour: Color = .black
    public var body: some View {
        Text(text).font(.system(size: size)).foregroundColor(colour).multilineTextAlignment(align).fixedSize(horizontal: false, vertical: true)
    }
}

public struct TextStyles_Previews: PreviewProvider {
    public static var previews: some View {
        VStack{
            SecondaryText("Secondary\nText").background(Color.black)
            SecondaryText("Really long body text title that should wrap over a couple of lines", size: 18)
            HeaderText("Header Text")
            BodyText(text: "Body Text")
            SecondaryText("Secondary Text")
            HeaderText("Header Text", size: 30, colour: .blue)
            BodyText(text: "Body Text")
            SecondaryText("Secondary Text")
            SpacedBodyText(text: "Really long body text title that should wrap over a couple of lines", size: 18)
            SecondaryText("Really long title that should wrap over a couple of lines", size: 18)
        }
    }
}
