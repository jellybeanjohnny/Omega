//
//  HomeViewController.swift
//  Omega
//
//  Created by Matt Amerige on 12/21/16.
//  Copyright © 2016 Matt Amerige. All rights reserved.
//

import UIKit
import SnapKit
import SharedCode

class HomeViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    addDemoLabel()
    
    jDictTest()
  }
  
  func addDemoLabel() {
    let helloWorldLabel = UILabel()
    helloWorldLabel.text = "See a list of your decks here"
    view.addSubview(helloWorldLabel)
    
    helloWorldLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
    
  }
  
  func jDictTest() {
    let interface = JDictInterface()
    interface.readXMLDefault()
  }


}
