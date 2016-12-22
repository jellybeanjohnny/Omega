//
//  Entry.swift
//  Omega
//
//  Created by Matt Amerige on 12/22/16.
//  Copyright © 2016 Matt Amerige. All rights reserved.
//

import UIKit

public class Entry: NSObject {

  /**
   Corresponds to a 'word' in a typical dictionary
  */
  public let term: String
  
  /**
   A list of all definitions for the term
  */
  public let definitions: [String]
  
  
  init(term: String, definitions: [String]) {
    self.term = term
    self.definitions = definitions
    super.init()
  }
  
  
  
}
