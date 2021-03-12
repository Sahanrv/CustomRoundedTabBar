//
//  RoundedCenterButtonTabBar.swift
//  CustomRoundedTabBar
//
//  Created by Sahan Ravindu on 5/13/20.
//  Copyright © 2020 Sahan Ravindu. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedCenterButtonTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let buttonRadious: CGFloat = 35
        return abs(self.center.x - point.x) > buttonRadious || abs(point.y) > buttonRadious
    }
    
    private func addShape(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
        
        //first curve down
//        path.addCurve(to: CGPoint(x: centerWidth, y: height), controlPoint1: CGPoint(x: (centerWidth - 30), y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: height))
//        //second curve up
//        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0), controlPoint1: CGPoint(x: (centerWidth + 35), y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
//
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: height, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0), clockwise: false)
        
        //complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat {return self * .pi / 180}
    var radiandToDegrees: CGFloat {return self * 180 / .pi}
}
