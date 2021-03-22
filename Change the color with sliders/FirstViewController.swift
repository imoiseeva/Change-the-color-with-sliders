//
//  FirstViewController.swift
//  Change the color with sliders
//
//  Created by Irina Moiseeva on 20.03.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func changeColorOfBackgraund(_ color: UIColor)
}

class FirstViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.colorForBackground = view.backgroundColor
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func changeColorOfBackgraund(_ color: UIColor) {
        view.backgroundColor = color
    }
}
