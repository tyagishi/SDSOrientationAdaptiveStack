//
//  SDSOrientationAdaptiveStack.swift
//
//  Created by : Tomoaki Yagishita on 2021/06/03
//  © 2021  SmallDeskSoftware
//

import SwiftUI
import Combine

public struct SDSOrientationAdaptiveStack<Content1: View, Content2: View> : View {
    var firstContent: Content1
    var secondContent: Content2
    @State var orientation: UIDeviceOrientation
    
    public init(@ViewBuilder first: () -> Content1, @ViewBuilder second: () -> Content2 ) {
        self.firstContent = first()
        self.secondContent = second()
        self._orientation = State(wrappedValue: UIDevice.current.orientation)
    }

    public var body: some View {
        ZStack {
            if orientation == .landscapeRight || orientation == .landscapeLeft {
                HStack {
                    firstContent
                    secondContent
                }
            } else {
                VStack {
                    firstContent
                    secondContent
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            orientation = UIDevice.current.orientation
        }
    }
}
