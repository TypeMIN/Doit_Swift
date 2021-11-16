//
//  ViewController.swift
//  Challenge09
//
//  Created by 이민식 on 2021/11/16.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var lblNum: UILabel!
  @IBOutlet var pageControl: UIPageControl!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    pageControl.numberOfPages = 10
    pageControl.currentPage = 0
    
    pageControl.pageIndicatorTintColor = UIColor.gray
    pageControl.currentPageIndicatorTintColor = UIColor.black
    
    lblNum.text = String(1)
  }

  @IBAction func pageChange(_ sender: UIPageControl) {
    lblNum.text = String(pageControl.currentPage + 1)
  }
  
}

