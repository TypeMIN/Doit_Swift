//
//  ViewController.swift
//  Tap
//
//  Created by 이민식 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func btnMoveImageView(_ sender: UIButton) {
    tabBarController?.selectedIndex = 1
  }
  
  @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
    tabBarController?.selectedIndex = 2
  }
  
}

