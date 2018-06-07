//
//  Shape.swift
//  Paint
//
//  Created by Timur Kaldybek on 12.02.18.
//  Copyright © 2018 Timur Kaldybek. All rights reserved.
//

import Foundation
import UIKit

struct Shape{
    private var color = UIColor.black
    private var firstPoint : CGPoint?
    private var endPoint : CGPoint?
    private var isFilled : Bool?
    var kind = ""
    var width:CGFloat = 6.0
    
    private lazy var dict: Dictionary<String, UIBezierPath> = [
        "r":drawRect(),
        "c":drawCircle(),
        "l":drawLine(),
        "t":drawTriangle(),
        "p":drawLine()
    ]
    
    init(firstPoint : CGPoint?, endPoint : CGPoint?, isFilled : Bool?){
        self.firstPoint = firstPoint
        self.endPoint = endPoint
        self.isFilled = isFilled
    }
    mutating func drawShape(){
        if isFilled!{
            dict[kind]?.fill()
        }
         if(kind == "p" || kind == "l"){
            dict[kind]?.stroke()
        }
        if !isFilled!{
            dict[kind]?.stroke()
        }
        
    }
    func drawCircle() -> UIBezierPath{
        let x_center =  CGFloat((Double((firstPoint?.x)!)+Double((endPoint?.x)!))/2)
        let y_center =  CGFloat((Double((firstPoint?.y)!)+Double((endPoint?.y)!))/2)
        let center = CGPoint(x: x_center, y: y_center)
        let radius = CGFloat((pow((pow((endPoint?.x)! - (firstPoint?.x)!, 2) + pow((endPoint?.y)! - (firstPoint?.y)!, 2)),0.5))/2)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        path.lineWidth = width
        color.set()
        return path
    }
    func drawRect()->UIBezierPath{
        let rectSize = CGSize(width: (endPoint?.x)! - (firstPoint?.x)!, height: (endPoint?.y)! - (firstPoint?.y)!)
        let rectOrigin = CGPoint(x: (firstPoint?.x)!, y: (firstPoint?.y)!)
        let rect = CGRect(origin: rectOrigin, size: rectSize)
        let path = UIBezierPath(rect: rect)
        path.lineWidth = width
        color.set()
        color.setStroke()
        return path
    }
    mutating func setType(_ type:String){
        kind = type
    }
    mutating func setColor(_ c:UIColor){
        color = c
    }
    func drawTriangle()->UIBezierPath{
        let path = UIBezierPath()
        path.move(to: firstPoint!)
        path.addLine(to: endPoint!)
        path.addLine(to: CGPoint(x: (firstPoint?.x)!, y: (endPoint?.y)!))
        path.addLine(to: firstPoint!)
        path.lineWidth = width
        path.close()
        color.set()
        return path
    }
    func drawLine()->UIBezierPath{
        let path = UIBezierPath()
        path.move(to: firstPoint!)
        path.addLine(to: endPoint!)
        path.lineWidth = width
        color.set()
        return path
    }
    
}
