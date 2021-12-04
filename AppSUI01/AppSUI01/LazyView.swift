//
//  LazyView.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
