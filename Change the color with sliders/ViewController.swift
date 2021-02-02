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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourBox.layer.cornerRadius = 15
        
        changeColour()
        
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        
        changeColour()
        
        switch sender.tag {
        case 0: redLabel.text = createString(from: sender)
        case 1: greenLabel.text = createString(from: sender)
        case 2: blueLabel.text = createString(from: sender)
        default: break
        }
        
    }
    
    private func changeColour() {
        
        colourBox.backgroundColor =  UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    private func createString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}



