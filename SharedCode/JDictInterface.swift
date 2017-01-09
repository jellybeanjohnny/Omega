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
  
  struct ElementType {
    static let kanjiElementType = "keb"
    static let readingElementType = "reb"
    static let senseElementType = "gloss"
  }
  
  var kanji: [String] = []
  
  let filePath = Bundle.main.path(forResource: "JMdict_e", ofType: "xml")
  
  var currentElement = ""
  
  var currentEntry: EDICTEntry!
  
  var entries: [EDICTEntry] = []
  
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
      currentEntry = EDICTEntry()
    }
    
  }
  
  public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    if elementName == "entry" {
      print("End of entry")
      print("\n")
      entries.append(currentEntry)
      currentEntry = nil
      print(entries)
    }
  }
  
  
  /*
   Entries consist of kanji elements, reading elements,
   general information and sense elements. Each entry must have at
   least one reading element and one sense element. Others are optional.
   */
  
  public func parser(_ parser: XMLParser, foundCharacters string: String) {
    
    let trimmedString = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

    if trimmedString.isEmpty {
      return
    }
    
    parseEDICTElements(inCharacters: trimmedString)
  }
  
  func parseEDICTElements(inCharacters string: String) {
    if currentElement == ElementType.kanjiElementType {
      currentEntry.kanjiElements.append(string)
    } else if currentElement == ElementType.readingElementType {
      currentEntry.readingElements.append(string)
    } else if currentElement == ElementType.senseElementType {
      currentEntry.senseElements.append(string)
    }
  }
  
  
}
