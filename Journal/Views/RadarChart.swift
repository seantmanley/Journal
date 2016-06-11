//
//  RadarChart.swift
//  Journal
//
//  Created by Sean Manley on 6/10/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class RadarChart: UIView {
    
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2 ), radius: (self.frame.width - 10) / 2, startAngle: DEGREES_TO_RADIANS(270.0), endAngle: DEGREES_TO_RADIANS(270.0+360.0), clockwise: true)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = path.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.blackColor().CGColor
        circleLayer.lineWidth = 2.0
        
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateDraw(duration: NSTimeInterval) {
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        
        anim.duration = duration
        
        anim.fromValue = 0
        anim.toValue = 1
        
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        circleLayer.strokeEnd = 1.0
        
        circleLayer.addAnimation(anim, forKey: "animatedRadar")
    }
    
    func DEGREES_TO_RADIANS(angle:Double) -> CGFloat {
        return CGFloat(angle / 180.0 * M_PI)
    }
    func RADIANS_TO_DEGREES(radians:Double) -> CGFloat {
        return CGFloat(radians * (180.0 / M_PI))
    }
}
