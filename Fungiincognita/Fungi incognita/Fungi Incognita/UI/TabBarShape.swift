//
//  TabBarShape.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct CustomShape: Shape {

    var xOffSet: CGFloat

    func path(in rect: CGRect) -> Path {

        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))

        let center = xOffSet - 3
        path.move(to: CGPoint(x: center-50, y: 0))

        let value1: CGFloat = 25
        let value2: CGFloat = 35

        let pt11 = CGPoint(x: center - value1, y: 0.0)
        let pt21 = CGPoint(x: center - value1, y: value2)
        path.addCurve(to: CGPoint(x: center, y: value2), controlPoint1: pt11, controlPoint2: pt21)

        let pt12 = CGPoint(x: center + value1, y: value2)
        let pt22 = CGPoint(x: center + value1, y: 0)
        path.addCurve(to: CGPoint(x: center + 50, y: 0), controlPoint1: pt12, controlPoint2: pt22)

        return Path(path.cgPath)

    }
}
