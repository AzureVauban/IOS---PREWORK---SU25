//
//  ViewController.swift
//  IOS PREWORK  - SU25
//
//  Created by Michael Elder on 4/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton! //button for changing background
    
    @IBOutlet weak var SETTINGS_BUTTON: UIButton! // button for settings
    
    private var animationsEnabled = true
    
    @IBOutlet weak var settingslabel: UILabel!    // label for settings (text box)
    @IBOutlet weak var animationSwitch: UISwitch! // button for animatin settings
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Example if you have an outlet for your button:
        
        //forced disabiling button autoresizing
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        SETTINGS_BUTTON.translatesAutoresizingMaskIntoConstraints = false
        settingslabel.translatesAutoresizingMaskIntoConstraints = false
        //animationSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // center horizontally
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // placement button anchorwise
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            // fixed size
            myButton.widthAnchor.constraint(equalToConstant: 200),
            // fixed width
            myButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([ // corrosponding settings for SETTINGS_BUTTON
            SETTINGS_BUTTON.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SETTINGS_BUTTON.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -50
            ),
            
            SETTINGS_BUTTON.heightAnchor.constraint(equalToConstant: 50),
            SETTINGS_BUTTON.widthAnchor.constraint(equalToConstant: 200)
                                    ])

        NSLayoutConstraint.activate([
          // center horizontally
          settingslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          // **only** pin its top to the button's bottom + 40pt
          settingslabel.topAnchor.constraint(
            equalTo: myButton.bottomAnchor,
            constant: 400   // ← adjust this number up/down to move it lower/higher
          )
        ])
        

        // Auto Layout to let the label hug its content tightly
        settingslabel.setContentHuggingPriority(.required, for: .horizontal)
        settingslabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        // give the label its text now
        settingslabel.text = "Press the toggle to disable animations"
        settingslabel.backgroundColor = UIColor.black


            // start hidden
        settingslabel.isHidden   = true
        animationSwitch.isHidden = true
        
        
        
        // attributes for CHANGE BACKGROUND button
        myButton.layer.cornerRadius = 10
        myButton.setTitle("Press Me!", for: .normal)
        
        
        // attributes for settings label
        
        // modify font
        if let bradley = UIFont(name: "BradleyHandITCTT-Bold",size:20.0) {
            myButton.titleLabel?.font = bradley
            SETTINGS_BUTTON.titleLabel?.font = bradley
            settingslabel.font = bradley
        } else { // happens because the font does not exist
            myButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            SETTINGS_BUTTON.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            settingslabel.font = UIFont.systemFont(ofSize: 20)
        }
        
        
        myButton.backgroundColor = UIColor.black
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        myButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        
    
        
        // attributes for PROMPT SETTINGS button
        SETTINGS_BUTTON.backgroundColor = UIColor.black
        SETTINGS_BUTTON.setTitleColor(UIColor.white, for: .normal)
        SETTINGS_BUTTON.layer.cornerRadius = 10
        SETTINGS_BUTTON.setTitle("Settings", for: .normal)
        SETTINGS_BUTTON.backgroundColor = UIColor.black
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        animationSwitch.isHidden = true // hide animation switch
    }
    
    @IBAction func openSettings(_ sender: UIButton) {
        
        animationSwitch.isHidden.toggle()
        // optional: change your button title so user knows
        if animationSwitch.isHidden {
            sender.setTitle("Show Settings", for: .normal)
            settingslabel.isHidden = true
        } else {
            sender.setTitle("Hide Settings", for: .normal)
            settingslabel.isHidden = false
        }
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
        if animationSwitch.isOn {
            
            
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor     = randomColor
                self.myButton.backgroundColor = complementColor
                self.myButton.setTitleColor(randomColor, for: .normal)
                self.SETTINGS_BUTTON.backgroundColor = complementColor
                self.SETTINGS_BUTTON.setTitleColor(randomColor, for: .normal)
                self.settingslabel.textColor = complementColor
                self.settingslabel.backgroundColor = randomColor
            }
        } else {
            view.backgroundColor     = randomColor
            myButton.backgroundColor = complementColor
            settingslabel.textColor = complementColor
            settingslabel.backgroundColor = randomColor
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



