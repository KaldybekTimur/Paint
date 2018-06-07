//
//  DrawView.swift
//  Paint
//
//  Created by Timur Kaldybek on 12.02.18.
//  Copyright © 2018 Timur Kaldybek. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var color = UIColor.black
    var initialPoint: CGPoint?
    var endedpoint : CGPoint?
    var viewControl = ViewController()
    var shapes:[Shape]=[]
    var isOn = true
    var shape:Shape?
    var type = ""
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect){
        if endedpoint != nil{
            for sh in shapes{
                var x = sh
                x.drawShape()
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initialPoint = touches.first?.location(in: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if type == "p"{
            endedpoint = touches.first?.location(in: self)
            shape = Shape.init(firstPoint: initialPoint!, endPoint: endedpoint!, isFilled: isOn)
            shape?.setType(type)
            shape?.setColor(color)
            shapes.append(shape!)
            setNeedsDisplay()
            initialPoint! = endedpoint! 
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endedpoint = touches.first?.location(in: self)
        shape = Shape.init(firstPoint: initialPoint!, endPoint: endedpoint, isFilled: isOn)
        shape?.setType(type)
        shape?.setColor(color)
        shapes.append(shape!)
        setNeedsDisplay()
    }
    
    
    

}
