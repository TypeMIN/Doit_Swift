//
//  ViewController.swift
//  Challenge05
//
//  Created by 이민식 on 2021/11/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  let MAX_ARRAY_SIZE = 10
  let PICKER_VIEW_COLUMN = 2
  let PICKER_VIEW_HEIGHT:CGFloat = 80
  var imageNameArray = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
  var imageArray = [UIImage?]()
  
  @IBOutlet var pickerImage: UIPickerView!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var lblImageName: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    for i in 0 ..< MAX_ARRAY_SIZE {
      let image = UIImage(named: imageNameArray[i])
      imageArray.append(image)
    }
    
    lblImageName.text = imageNameArray[0]
    imageView.image = imageArray[0]
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return PICKER_VIEW_COLUMN
  }

  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return PICKER_VIEW_HEIGHT
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return imageNameArray.count
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let imageView = UIImageView(image: imageArray[row])
    imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
    
    return imageView
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

//   Challenge 05-1
//   lblImageName.text = imageNameArray[row]
//   imageView.image = imageArray[row]

  
//  Challenge 05-2
    if (component == 0) {
      lblImageName.text = imageNameArray[row]
    }
    else {
      imageView.image = imageArray[row]
    }
  }

}

