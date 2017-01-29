//
//  ViewController.swift
//  colorMix
//
//  Created by Kyrhee Powell on 1/21/17.
//  Copyright © 2017 Translated Ideas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    //send info somewhere, connected to something in the story board
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
   
    
    /// Called when view is finished loading
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = .black
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        updateControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateColor() {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        if greenSwitch .isOn{
            green = CGFloat(greenSlider.value)
        }
        
        if blueSwitch .isOn{
            blue = CGFloat(blueSlider.value)
        }
        
        if redSwitch .isOn{
            red = CGFloat(redSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        colorView.backgroundColor = color
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        
    }
    
    //MARK: Actions
    //runs code and controls your current view
    
    /// Allows user to change color with red, green, and blue sliders
    ///
    /// - parameter sender: UISwitch button in the view controller
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
    }
    
    
    /// Allows user to change color with red, green, and blue sliders
    ///
    /// - parameter sender: UISlider Object
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func myUnwindAction(unWindSegue: UIStoryboardSegue){
        
    }
    
    
    /// Resets values of all colors to 0 and returns switches and sliders to their original position
    ///
    /// - parameter sender: UIButton Object
    @IBAction func reset(_ sender: UIButton) {
        greenSlider.value = 1
        blueSlider.value = 1
        redSlider.value = 1
        
        greenSwitch .isOn = false
        blueSwitch .isOn = false
        redSwitch .isOn = false
        
        colorView.backgroundColor = .black
        updateControls()
    }
    
    
}

