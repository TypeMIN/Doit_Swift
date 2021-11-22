//
//  EditViewController.swift
//  Navigation
//
//  Created by 이민식 on 2021/11/22.
//

import UIKit

protocol EditDelegate {
  func didMessageEditDone(_ controller: EditViewController, message: String)
  func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {

  var textWayValue: String = ""
  var textMessage: String = ""
  var delegate : EditDelegate?
  var isOn = false
  
  @IBOutlet var lblWay: UILabel!
  @IBOutlet var txtMessage: UITextField!
  @IBOutlet var swisOn: UISwitch!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    lblWay.text = textWayValue
    txtMessage.text = textMessage
    swisOn.isOn = isOn
    }
    
  @IBAction func btnDone(_ sender: UIButton) {
    if delegate != nil {
      delegate?.didMessageEditDone(self, message: txtMessage.text!)
      delegate?.didImageOnOffDone(self, isOn: isOn)
    }
    
    _ = navigationController?.popViewController(animated: true)
  }
  
  @IBAction func swImageOnOff(_ sender: UISwitch) {
    if sender.isOn {
      isOn = true
    } else {
      isOn = false
    }
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
