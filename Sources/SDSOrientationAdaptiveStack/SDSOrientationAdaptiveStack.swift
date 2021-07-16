//
//  SDSOrientationAdaptiveStack.swift
//
//  Created by : Tomoaki Yagishita on 2021/06/03
//  © 2021  SmallDeskSoftware
//

import SwiftUI
import Combine
import UIKit

extension UIDevice {
    static public func stableDeviceOrientation() -> UIDeviceOrientation {
        if UIDevice.current.orientation.isValidInterfaceOrientation {
            return UIDevice.current.orientation
        } else {
            return UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? UIDeviceOrientation.landscapeLeft : UIDeviceOrientation.portrait
        }
    }
}

extension UIDeviceOrientation: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown:
            return "unknown"
        case .portrait:
            return "portrait"
        case .portraitUpsideDown:
            return "portraitUpsideDown"
        case .landscapeLeft:
            return "landscapeLeft"
        case .landscapeRight:
            return "landscapeRight"
        case .faceUp:
            return "faceUp"
        case .faceDown:
            return "faceDown"
        }
    }
}

public struct SDSOrientationAdaptiveStack<Content1: View, Content2: View> : View {
    var firstContent: Content1
    var secondContent: Content2
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @Binding var firstContentRatio: CGFloat
    
    public init(@ViewBuilder first: () -> Content1, @ViewBuilder second: () -> Content2, ratio: Binding<CGFloat> = .constant(0.5) ) {
        self.firstContent = first()
        self.secondContent = second()
        self._firstContentRatio = ratio
        self._orientation = State(wrappedValue: UIDevice.stableDeviceOrientation())
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
        .onAppear(perform: {
            orientation = UIDevice.stableDeviceOrientation()
        })
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            orientation = UIDevice.stableDeviceOrientation()
        }
    }
    
}
