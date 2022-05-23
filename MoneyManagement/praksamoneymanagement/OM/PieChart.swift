//
//  File.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 14.3.22..
//

import Foundation
import UIKit


extension CGFloat {
    func radians() -> CGFloat {
        let b = CGFloat(Double.pi) * (self/180)
        return b
    }
}

extension UIBezierPath {
    convenience init(circleSegmentCenter center:CGPoint, radius:CGFloat, startAngle:CGFloat, endAngle:CGFloat)
    {
        self.init()

        self.move(to:center)
        self.addLine(to: CGPoint.pointOnCircle(center: center, radius: radius, angle: startAngle.radians()))
        
        self.addArc(withCenter: center, radius:radius, startAngle:startAngle.radians(), endAngle: endAngle.radians(), clockwise:true)
        self.addLine(to: center)
        self.close()
    }
}

extension CGPoint
{
    static func pointOnCircle(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint
    {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
            
        return CGPoint(x: x, y: y)
    }
}
