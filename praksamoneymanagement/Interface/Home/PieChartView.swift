//
//  PieChartView.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 14.3.22..
//

import UIKit

class PieChartView: UIView
{
    struct Piece
    {
        var percent: Double = 0
        var color: String = ""
    }
    
    var pieces = [Piece]()
    {
        didSet
        {
            self.setNeedsDisplay()
        }
    }
    
    //let piePieces = [(UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: 250, endAngle: 360)

    
    override func draw(_ rect: CGRect)
    {
        //var piecesData = [(UIBezierPath, UIColor)]()
        var startAngle: Double = 0
        var endAngle: Double = 0
        
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let radius:CGFloat = 100
        
        UIColor.white.setStroke()
        for piece in pieces
        {
            //Veci krug
            
            endAngle += Double(piece.percent * 0.01 * 360)
            
            print(piece.percent)

            let path = UIBezierPath(circleSegmentCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle))

            UIColor.hexStringToUIColor(hex: piece.color).setFill()
            
            path.stroke()
            path.fill()
            
            startAngle = endAngle
        }
        
        let innerPath = UIBezierPath(circleSegmentCenter: center, radius: radius/2, startAngle: 0, endAngle: 360)
        UIColor.white.setFill()
        innerPath.stroke()
        innerPath.fill()
        /*for p in piecesData
        {
            let layer = CAShapeLayer()
            layer.path = p.0.cgPath
            layer.fillColor = p.1.cgColor
            layer.strokeColor = UIColor.white.cgColor
            layers.append(layer)
        }*/
        
        super.draw(rect)
    }
    /*func pieChart(pieces:[(UIBezierPath, UIColor)], viewRect:CGRect) -> UIView {
        var layers = [CAShapeLayer]()
        for p in pieces {
            let layer = CAShapeLayer()
            layer.path = p.0.CGPath
            layer.fillColor = p.1.CGColor
            layer.strokeColor = UIColor.whiteColor().CGColor
            layers.append(layer)
        }
        let view = UIView(frame: viewRect)
        for l in layers {
            
            view.layer.addSublayer(l)
            
            
        }
        return view
    }*/
}
