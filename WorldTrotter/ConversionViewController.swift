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
  
  @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, !text.isEmpty {
      celciusLabel.text = text
    } else {
      celciusLabel.text = "???"
    }
    
  }
  
}
