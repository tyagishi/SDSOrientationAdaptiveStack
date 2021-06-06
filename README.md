# SDSOrientationAdaptiveStack


![platform](https://img.shields.io/badge/Platform-iOS-lightgrey)
![macOS iOS](https://img.shields.io/badge/platform-iOS_macOS-lightgrey)
![SPM is supported](https://img.shields.io/badge/SPM-Supported-orange)
![license](https://img.shields.io/badge/license-MIT-lightgrey)

orientation 
<!--
comment
-->

## Feature

swifth HStack / VStack depends on device orientation

## in 30 sec.
https://user-images.githubusercontent.com/6419800/120910504-683d5a00-c6ba-11eb-973b-a091a29f4f7b.mp4

## Code Example
```
//
//  ContentView.swift
//
//  Created by : Tomoaki Yagishita on 2021/06/03
//  © 2021  SmallDeskSoftware
//

import SwiftUI
import SDSOrientationAdaptiveStack

struct ContentView: View {
    var body: some View {
        SDSOrientationAdaptiveStack(first: {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .overlay(Text("First"))
        }, second: {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .overlay(Text("Second"))
        })
            .padding()
    }
}
```

## Installation
use Swift Package Manager: URL: https://github.com/tyagishi/SDSOrientationAdaptiveStack

## Requirements
none

## Note
