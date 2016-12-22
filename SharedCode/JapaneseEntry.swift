//
//  JapaneseEntry.swift
//  Omega
//
//  Created by Matt Amerige on 12/22/16.
//  Copyright © 2016 Matt Amerige. All rights reserved.
//

import UIKit

public class JapaneseEntry: Entry {
  
  public let reading: String
  
  init(term: String, definitions: [String], reading: String) {
    self.reading = reading
    super.init(term: term, definitions: definitions)
  }
  
  
}
