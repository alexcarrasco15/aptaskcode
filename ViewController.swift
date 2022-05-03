//
//  ViewController.swift
//  game thing
//
//  Created by Alex Carrasco on 4/6/22.
//  Copyright © 2022 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func fullReset () {
        resetTints()
        mode = 1
        history = []
        currentIndex = 0
    }
    
    @IBAction func reset(_ sender: Any) {
        fullReset()
    }
    
    @IBOutlet weak var leftSquare: UIImageView!
    
    @IBOutlet weak var middleSquare: UIImageView!
    
    @IBOutlet weak var rightSquare: UIImageView!
    
    var blue = CGFloat(0)
    
    var state = "none"
    
    var mode = 1
    
    var currentIndex = 0
    
    var history = [String]()
    
    func resetTints (){
        leftSquare.tintColor = .blue
        middleSquare.tintColor = .blue
        rightSquare.tintColor = .blue
    }
 
    @IBOutlet weak var slider1: UISlider!
    
    
    @IBAction func slider(_ sender: Any) {
        
        resetTints()
            
        blue = CGFloat(slider1.value)
        if slider1.value < 1 {
            leftSquare.tintColor = .green
            state = "left"
        } else if slider1.value < 2 {
            middleSquare.tintColor = .green
            state = "middle"
        } else if slider1.value <= 3 {
            rightSquare.tintColor = .green
            state = "right"
        }
      
    }
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        if mode == 1 {
            history.append(state)
            resetTints()
        } else {
            resetTints()
            
            if currentIndex >= history.count {
                print("too big index")
            } else if history[currentIndex] == "middle" {
                middleSquare.tintColor = .green
            } else if history[currentIndex] == "left" {
                leftSquare.tintColor = .green
            } else if history[currentIndex] == "right" {
                rightSquare.tintColor = .green
            } else {resetTints()}
            currentIndex += 1
        }
        
        }
            

        

    
    @IBAction func submit(_ sender: UIButton) {
            print(history)
            mode = 2
            resetTints()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fullReset()
        
    }

   
}

