//
//  ViewController.swift
//  Paint
//
//  Created by Timur Kaldybek on 12.02.18.
//  Copyright © 2018 Timur Kaldybek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DrawingView.viewControl = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Figures(_ sender: UIButton) {
        DrawingView.type = sender.currentTitle!
    }
 
    @IBAction func ColorButton(_ sender: UIButton) {
        DrawingView.color = sender.currentTitleColor
    }
    
    @IBAction func longUndo(_ sender: UILongPressGestureRecognizer) {
        if !DrawingView.shapes.isEmpty{
            DrawingView.shapes.removeAll()
            DrawingView.setNeedsDisplay()
        }
    }
    @IBAction func UndoButton(_ sender: UIButton) {
        if !DrawingView.shapes.isEmpty{
            DrawingView.shapes.removeLast()
            DrawingView.setNeedsDisplay()
        }
    }
    
    @IBAction func FillButton(_ sender: UISwitch) {
        DrawingView.isOn = sender.isOn
    }
    
    @IBOutlet weak var DrawingView: DrawView!
    
    
}

