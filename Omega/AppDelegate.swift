//
//  AppDelegate.swift
//  Omega
//
//  Created by Matt Amerige on 12/21/16.
//  Copyright © 2016 Matt Amerige. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = UIColor.black
    window?.makeKeyAndVisible()
    
    window?.rootViewController = HomeViewController()
    
    return true
  }



}

