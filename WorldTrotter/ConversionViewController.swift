//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Floobot on 16/11/19.
//  Copyright © 2019 Floobot. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
  
  @IBOutlet var celciusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  var farenheitValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let farenheitValue = farenheitValue {
      return farenheitValue.converted(to: .celsius)
    } else { return nil }
  }
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celciusLabel.text = "\(celsiusValue.value)"
    } else {
      celciusLabel.text = "???"
    }
  }
  
  @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
      farenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      farenheitValue = nil
    }
  }
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
  }
  
}
