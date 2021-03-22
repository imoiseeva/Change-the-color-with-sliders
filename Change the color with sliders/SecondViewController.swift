//
//  SecondViewController.swift
//  Change the color with sliders
//
//  Created by Irina Moiseeva on 29.01.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var colourBox: UIView!
    
    var delegate: SecondViewControllerDelegate!
    var colorForBackground: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourBox.layer.cornerRadius = 15
        colourBox.backgroundColor = colorForBackground
        
        setSliders()
        setLabelsValue(for: redLabel, greenLabel, blueLabel)
        setTextFielValue(for: redTextField, greenTextField, blueTextField)
        addDoneButton(to: redTextField, greenTextField, blueTextField)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setLabelsValue(for: redLabel)
            setTextFielValue(for: redTextField)
        case 1:
            setLabelsValue(for: greenLabel)
            setTextFielValue(for: greenTextField)
        case 2:
            setLabelsValue(for: blueLabel)
            setTextFielValue(for: blueTextField)
        default: break
        }
        changeColour()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        delegate.changeColorOfBackgraund(colourBox.backgroundColor ?? .brown)
        dismiss(animated: true)
        
    }
    
    // MARK: - Private Methods
    
    private func setLabelsValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = createString(from: redSlider)
            case 1: greenLabel.text = createString(from: greenSlider)
            case 2: blueLabel.text = createString(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setTextFielValue(for textField: UITextField...) {
        textField.forEach { textField in
            switch textField.tag {
            case 0: redTextField.text = createString(from: redSlider)
            case 1: greenTextField.text = createString(from: greenSlider)
            case 2: blueTextField.text = createString(from: blueSlider)
            default:
                break
            }
        }
    }
    
    private func changeColour() {
        colourBox.backgroundColor =  UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: colorForBackground)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func createString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title:"Done",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let value = Float(text) {
            switch  textField.tag {
            case 0: redSlider.setValue(value, animated: true);
                setLabelsValue(for: redLabel)
            case 1: greenSlider.setValue(value, animated: true);
                setLabelsValue(for: greenLabel)
            case 2: blueSlider.setValue(value, animated: true);
                setLabelsValue(for: blueLabel)
            default:
                break
            }
            changeColour()
            return
        }
        showAlert(title: "Input error", message: "Please, enter the correct value")
    }
}



