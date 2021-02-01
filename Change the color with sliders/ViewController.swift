//
//  ViewController.swift
//  Change the color with sliders
//
//  Created by Irina Moiseeva on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var colourBox: UIView!
    
    var red: CGFloat = 0.50
    var green: CGFloat = 0.50
    var blue: CGFloat = 0.50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLabel.text = "0.50"
        greenLabel.text = "0.50"
        blueLabel.text = "0.50"
        colourBox.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        changeColour(valueOfSlider: sender.value)
    }
    
    func changeColour(valueOfSlider: Float) {
        let colour = String(format: "%.2f", valueOfSlider)
        blueLabel.text = colour
        blue = CGFloat(valueOfSlider)
        colourBox.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
}

