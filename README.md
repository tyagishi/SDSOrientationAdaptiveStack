# SDSOrientationAdaptiveStack

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
Swift Package Manager: URL:

## Requirements
none

## Note
