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
    
    segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topAnchor = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint =  segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topAnchor.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
  }
  
  @objc
  func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
    }
  }
  
}
