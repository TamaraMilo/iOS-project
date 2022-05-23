//
//  TubeView.swift
//  praksatubes
//
//  Created by Webelinx Praksa 1  on 23/03/2022.
//

import UIKit

enum Color : String, CaseIterable
{
    case ececec
    case c8a9e8
    case a9dfe8
    case bbc257
    case ff6060
    case b86cbf
    case f6a784
    case c7ab89
    case b9e2da
    case ecd8ba
    
}
protocol BallMove: AnyObject
{
    func tapTube(tube: TubeView)
}


class TubeView: UIView {
    
    var indexTube = 0
    var ball = [Int]()
    var balls = Stack<Ball>()
    
    weak var delegate : BallMove?

    init(frame: CGRect, balls: [Int], indeks: Int)
    {
        super.init(frame: frame)
        indexTube = indeks
        let image = UIImage(named: "epruveta.png");
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 200));
        imageView.image = image
        self.addSubview(imageView)
        
        ball = balls
        
        setBalls()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapnut))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapnut()
    {
        delegate?.tapTube(tube: self)
    }
    
    func removeBall()-> Ball?
    {
        let ball = balls.pop()
        ball?.removeFromSuperview()
        return ball
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBalls()
    {
        let radius = CGFloat(self.frame.width/2 - 10)
        let ballSize = CGSize(width: self.frame.width , height: radius*2)
        var origin: CGPoint = .zero
        
        for index in 0 ..< ball.count
        {
            origin = CGPoint(x: 0, y: self.frame.height - ballSize.height * (CGFloat(index) + 1)-1.5)
            
            let color = Color.allCases[ball[index]-1].rawValue
            
            let centar = CGPoint(x: ballSize.width * 0.5, y: ballSize.height * 0.5)
            let bRect = CGRect(origin: origin, size: ballSize)
    
                
            let newBall = Ball(frame: bRect, center: centar, radiuss: radius, colorOfBall: String(color), indexTube: indexTube)
            print(color)
            
            balls.push(newBall)
            self.addSubview(newBall)
            
            
            
        }
        
        
        
    }
    
}
class Ball: UIView
{
    var centar : CGPoint!
    var radius : CGFloat!
    var color: String!
    var index: Int!
    
    init(frame: CGRect, center: CGPoint, radiuss: CGFloat, colorOfBall: String, indexTube: Int)
    {
      
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        centar = center
        radius = radiuss
        color = colorOfBall
        index = indexTube

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect)
    {
        UIColor.hexStringToUIColor(hex: color).setStroke()
        let path = UIBezierPath(circleSegmentCenter: centar, radius: radius)
        UIColor.hexStringToUIColor(hex: color).setFill()
        path.stroke()
        path.fill()
        super.draw(rect)
    }
    
  
}
