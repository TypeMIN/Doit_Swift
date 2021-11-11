//
//  ViewController.swift
//  Map
//
//  Created by 이민식 on 2021/11/11.
//

import UIKit
import MapKit

class ViewController: UIViewController {

  @IBOutlet var myMap: MKMapView!
  @IBOutlet var lblLocationInfo1: UILabel!
  @IBOutlet var lblLocationinfo2: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
  }
  
}

