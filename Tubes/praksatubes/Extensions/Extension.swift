//
//  Extension.swift
//  praksatubes
//
//  Created by Webelinx Praksa 1  on 24/03/2022.
//
import UIKit
import Foundation

protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable
{
    var isEmpty: Bool { peek() == nil }
}

extension UIBezierPath
{
    convenience init(circleSegmentCenter center: CGPoint, radius: CGFloat)
    {
        self.init()
        
        self.move(to: center)
        self.addArc(withCenter: center, radius: radius, startAngle: 0.0, endAngle: 360, clockwise: true )
        self.close()
                                
    }
}

extension UIColor
{
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
struct Stack<Element>: Stackable where Element: Equatable
{
    var numOfElements: Int = 0
    private var storage = [Element]()
    func peek() -> Element? { storage.last }
    mutating func push(_ element: Element) {
        storage.append(element)
        numOfElements += 1
    }
    mutating func pop() -> Element?
    {
        numOfElements -= 1
       return storage.popLast()
       
        
    }
}

extension Stack: Equatable
{
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool { lhs.storage == rhs.storage }
}

extension Stack: CustomStringConvertible
{
    var description: String { "\(storage)" }
}
    
extension Stack: ExpressibleByArrayLiteral
{
    init(arrayLiteral elements: Self.Element...) { storage = elements }
}
