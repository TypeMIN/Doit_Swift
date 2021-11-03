//
//  ViewController.swift
//  Challenge03
//
//  Created by 이민식 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {
  var numImage: Int!
  let maxImage: Int = 6
  let minImage: Int = 1
  
  @IBOutlet var imgView: UIImageView!
  @IBOutlet var btnPre: UIButton!
  @IBOutlet var btnNext: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    numImage = 1
    imgView.image = UIImage(named: "1.png")
    
    
  }

  @IBAction func btnPreView(_ sender: UIButton) {
    if(numImage == minImage) {
      numImage = maxImage
    }
    else {
      numImage = numImage - 1
    }
    
    let imageName = String(numImage) + ".png"
    imgView.image = UIImage(named: imageName)
  }
  @IBAction func btnNextView(_ sender: UIButton) {
    if (numImage == maxImage) {
      numImage = minImage
    }
    else {
      numImage = numImage + 1
    }
    
    let imageName = String(numImage) + ".png"
    imgView.image = UIImage(named: imageName)
  }
  
}

