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
    @Binding var firstContentRatio: CGFloat
    
    public init(@ViewBuilder first: () -> Content1, @ViewBuilder second: () -> Content2, ratio: Binding<CGFloat> = .constant(0.5) ) {
        self.firstContent = first()
        self.secondContent = second()
        self._orientation = State(wrappedValue: UIDevice.current.orientation)
        self._firstContentRatio = ratio
    }

    public var body: some View {
        ZStack {
            GeometryReader { geom in
                if orientation == .landscapeRight || orientation == .landscapeLeft {
                    HStack {
                        if firstContentRatio > 0.01 {
                            firstContent
                                .frame(width: geom.size.width * firstContentRatio)
                        } else {
                            EmptyView()
                        }
                        if firstContentRatio < 0.99 {
                            secondContent
                                .frame(width: geom.size.width * (1.0-firstContentRatio))
                        } else {
                            EmptyView()
                        }
                    }
                } else {
                    VStack {
                        if firstContentRatio > 0.01 {
                            firstContent
                                .frame(height: geom.size.height * firstContentRatio)
                        } else {
                            EmptyView()
                        }
                        if firstContentRatio < 0.99 {
                            secondContent
                                .frame(height: geom.size.height * (1.0-firstContentRatio))
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            if UIDevice.current.orientation.isValidInterfaceOrientation {
                orientation = UIDevice.current.orientation
            }
        }
    }
}
