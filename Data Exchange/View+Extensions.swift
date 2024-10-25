//
//  SwiftUIMagic.swift
//  Competency Cloud
//
//  Created by Mike Hall on 19/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }

    func tappable(_ action: (() -> Void)?) -> some View {
        if let action {
            return AnyView(self.onTapGesture {
                action()
            })
        } else {
            return AnyView(self)
        }
    }

    func tappableWithReturn<T>(_ action: ((T) -> Void)?, item: T) -> some View {
        if let action {
            return AnyView(self.onTapGesture {
                action(item)
            })
        } else {
            return AnyView(self)
        }
    }
    
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
  }

