    import XCTest
    @testable import SDSOrientationAdaptiveStack
    import SwiftUI
    import UIKit

    final class SDSOrientationAdaptiveStackTests: XCTestCase {
        func testLayout() throws {
            let sut = ContentView()
            XCTAssertNotNil(sut)
        }
    }

    struct ContentView: View {
        var body: some View {
            SDSOrientationAdaptiveStack(first: {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .overlay(Text("First"))
                    .accessibility(identifier: "firstRect")
            }, second: {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                    .overlay(Text("Second"))
            })
                .padding()
        }
    }
    
    
