//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Floobot on 16/11/19.
//  Copyright © 2019 Floobot. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Map view controller has loaded successfuly")
  }
  
  override func loadView() {
    //Creating a map view
    mapView = MKMapView()
    //Setting it as *the* view of this view controller
    view = mapView
    
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topAnchor = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
    let leadingAnchor = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
    let trailingAnchor = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
    
    topAnchor.isActive = true
    leadingAnchor.isActive = true
    trailingAnchor.isActive = true
    
  }
  
}
