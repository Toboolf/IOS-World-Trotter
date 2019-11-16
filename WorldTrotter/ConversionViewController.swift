//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Floobot on 16/11/19.
//  Copyright © 2019 Floobot. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var celciusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Convertion controller :3")
    updateCelsiusLabel()
  }
  
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
      celciusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
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
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
    let replacementTextHasDecimalSeparator = string.range(of: ".")
    
    if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
      return false
    } else { return true }
  }
  
}
