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
    celciusLabel.text = textField.text
  }
  
}
