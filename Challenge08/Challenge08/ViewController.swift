//
//  ViewController.swift
//  Challenge08
//
//  Created by 이민식 on 2021/11/11.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

  @IBOutlet var myMap: MKMapView!
  @IBOutlet var lblLocationInfo1: UILabel!
  @IBOutlet var lblLocatinoInfo2: UILabel!
  
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    lblLocationInfo1.text = ""
    lblLocatinoInfo2.text = ""
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    myMap.showsUserLocation = true
  }
  
  func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
    let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
    let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
    let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
    myMap.setRegion(pRegion, animated: true)
    return pLocation
  }
  
  func setAnnotation(latitudeValue: CLLocationDegrees, longituteValue : CLLocationDegrees, delta span :Double, title strTitle:String, subtitle strSubtitle:String) {
    let annotaion = MKPointAnnotation()
    annotaion.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longituteValue, delta: span)
    annotaion.title = strTitle
    annotaion.subtitle = strSubtitle
    myMap.addAnnotation(annotaion)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let pLocation = locations.last
    _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
    CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
      (placemarks, error) -> Void in
      let pm = placemarks!.first
      let country = pm!.country
      var address:String = country!
      if pm!.locality != nil {
        address += " "
        address += pm!.locality!
      }
      if pm!.thoroughfare != nil {
        address += " "
        address += pm!.thoroughfare!
      }
      
      self.lblLocationInfo1.text = "현재 위치"
      self.lblLocatinoInfo2.text = address
    })
    
    locationManager.stopUpdatingLocation()
  }

  @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      self.lblLocationInfo1.text = ""
      self.lblLocatinoInfo2.text = ""
      locationManager.startUpdatingLocation()
    } else if sender.selectedSegmentIndex == 1 {
      setAnnotation(latitudeValue: 35.57340, longituteValue: 129.18965, delta: 0.1, title: "UNIST", subtitle: "울산광역시 울주군 언양읍 유니스트길 50")
      self.lblLocationInfo1.text = "보고 계신 위치"
      self.lblLocatinoInfo2.text = "UNIST"
    } else if sender.selectedSegmentIndex == 2 {
      setAnnotation(latitudeValue: 37.92141, longituteValue: 128.09079, delta: 0.01, title: "KCTC", subtitle: "강원도 인제군 남면 응봉길")
      self.lblLocationInfo1.text = "보고 계신 위치"
      self.lblLocatinoInfo2.text = "KCTC"
    } else if sender.selectedSegmentIndex == 3 {
      setAnnotation(latitudeValue: 36.89082, longituteValue: 126.71750, delta: 0.01, title: "우리집", subtitle: "충청남도 당진시 송악읍 광명길 71")
      self.lblLocationInfo1.text = "보고 계신 위치"
      self.lblLocatinoInfo2.text = "우리집"
    }
  }
  
}

