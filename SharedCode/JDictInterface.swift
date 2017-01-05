//
//  JDictInterface.swift
//  Omega
//
//  Created by Matt Amerige on 12/22/16.
//  Copyright © 2016 Matt Amerige. All rights reserved.
//

import Foundation
import SWXMLHash

public class JDictInterface: NSObject {
  
  var kanji: [String] = []
  
  let filePath = Bundle.main.path(forResource: "JMdict_e", ofType: "xml")
  
  var currentElement: String!
  
  public func readXML() {
    let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
    
    let xml = SWXMLHash.parse(data)
    print(xml)
    
    
  }
  
  public override init() {
    // required to initialize the object outside of this framework
  }
  
  public func readXMLDefault() {
    let parser = XMLParser(contentsOf: URL(fileURLWithPath: filePath!))
    parser?.delegate = self
    parser?.parse()
  }
  
}

extension JDictInterface: XMLParserDelegate {
  
  public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    
    currentElement = elementName
    
    if currentElement == "entry" {
      print("Starting a new entry")
      // Create collection object to hold relevant data
    }
    
  }
  
  public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    if elementName == "entry" {
      print("End of entry")
      print("\n")
      // Add the collection object to a containing collection
    }
  }
  
  
  /*
   Entries consist of kanji elements, reading elements,
   general information and sense elements. Each entry must have at
   least one reading element and one sense element. Others are optional.
   */
  
  public func parser(_ parser: XMLParser, foundCharacters string: String) {
    
    let trimmedString = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    if (currentElement == "keb" || currentElement == "reb" || currentElement == "gloss") && !trimmedString.isEmpty  {
      print(trimmedString)
      // populate the collection object with the information gathered here
    }
    
    
    
  }
  
  
  
}
