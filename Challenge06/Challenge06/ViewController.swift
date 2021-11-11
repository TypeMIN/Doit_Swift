//
//  ViewController.swift
//  Challenge06
//
//  Created by 이민식 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
  let timeSelector: Selector = #selector(ViewController.updateTime)
  let interval = 1.0
  var count = 0
  
  var alarmTime: String = ""
  var isCheckAlert = false
  
  @IBOutlet var lblCurrentTime: UILabel!
  @IBOutlet var lblSelectTime: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
  }

  @IBAction func changeDatePicker(_ sender: UIDatePicker) {
    let datePickerView = sender
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
    lblSelectTime.text = formatter.string(from: datePickerView.date)
    
    formatter.dateFormat = "hh:mm aaa"
    alarmTime = formatter.string(from: datePickerView.date)
  }
  
  @objc func updateTime() {
    let date = NSDate()
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
    lblCurrentTime.text = formatter.string(from: date as Date)
    
    formatter.dateFormat = "hh:mm aaa"
    let currentTime = formatter.string(from: date as Date)
    
    if (alarmTime == currentTime) {
      if (isCheckAlert == false) {
        let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: UIAlertController.Style.alert)
        
        let checkAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {
          ACTION in self.isCheckAlert = true
        })
        
        alarmAlert.addAction(checkAction)
        present(alarmAlert, animated: true, completion: nil)
      }
    } else {
      isCheckAlert = false
    }
  }
}

