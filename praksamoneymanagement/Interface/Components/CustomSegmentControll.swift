//
//  CustomSegmentControll.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 10.3.22..
//

import Foundation
import UIKit

class CustomSegmentControl: UISegmentedControl
{
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let previousSelectedSegmentIndex = self.selectedSegmentIndex

        super.touchesEnded(touches, with: event)

        if previousSelectedSegmentIndex == self.selectedSegmentIndex {
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            if bounds.contains(touchLocation) {
                self.sendActions(for: .valueChanged)
            }
        }
    }
}
