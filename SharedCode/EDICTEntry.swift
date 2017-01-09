//
//  EDICTEntry.swift
//  Omega
//
//  Created by Matt Amerige on 1/5/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import Foundation
import RealmSwift

public class EDICTEntry: Object {

  //MARK:  Public Properties
  dynamic public var readingElements: [String] = []
  dynamic public var kanjiElements: [String] = []
  dynamic public var senseElements: [String] = []
  
  public override var description: String {
    return "Reading Elements: \(readingElements)\nKanji Elements: \(kanjiElements)\n Sense Elements: \(senseElements)"
  }
  
  //MARK: Private Properties
  dynamic var readingElementData: Data?
  dynamic var kanjiElementData: Data?
  dynamic var senseElementData: Data?
  dynamic var id = UUID().uuidString
  
  //MARK: - Realm Required Overrides
  override public static func ignoredProperties() -> [String] {
    return ["readingElements", "kanjiElements" ,"senseElements"]
  }
  
  override public static func primaryKey() -> String? {
    return "id"
  }
  
  

}


