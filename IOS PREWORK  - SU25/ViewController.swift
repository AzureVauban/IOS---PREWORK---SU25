//
//  ViewController.swift
//  IOS PREWORK  - SU25
//
//  Created by Michael Elder on 4/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Example if you have an outlet for your button:
        myButton.layer.cornerRadius = 10
        myButton.setTitle("Press Me!", for: .normal)
        myButton.backgroundColor = UIColor.black
        myButton.setTitleColor(UIColor.white, for: .normal)
        
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        //generate random components (fully opaque)
                let red   = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue  = CGFloat.random(in: 0...1)
                
                // build the two colors
                let randomColor     = UIColor(red: red,    green: green, blue: blue,    alpha: 1.0)
                let complementColor = UIColor(red: 1.0-red, green: 1.0-green, blue: 1.0-blue, alpha: 1.0)
                
                // animate them together
                UIView.animate(withDuration: 0.5) {
                    self.view.backgroundColor     = randomColor
                    self.myButton.backgroundColor = complementColor
                    self.myButton.setTitleColor(randomColor, for: .normal)
                }
            }
    //! REMEMBER, SET THE BUTTON TYPE TO CUSTOM, OTHER ATTRIBUTES WILL BE OVERWRITTEN
    }
    
    
    
    func changeColor()->( UIColor, CGFloat, CGFloat, CGFloat) {
        
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        return (color, red, green, blue)
    }



