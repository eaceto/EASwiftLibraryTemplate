//
//  TestClass.swift
//  EASwiftLibraryTemplate
//
//  Created by Kimi on 09/03/2022.
//  Copyright © 2022 Ezequiel Aceto. All rights reserved.
//

import Foundation

/// A class with a static function that masks strings
public class StringMasker {
   
    /// The default character used to mask strings
    public static let defaultMask = "*"
    
    /// Given a string it masks its content showing only the firsts and lasts characters
    ///
    /// - parameter string:   a String to **mask**
    /// - parameter mask:   a String of, preferably, length 1 to mask characters in **string**
    ///
    ///  ## Example:
    ///  ```swift
    ///  let string = "4003 1002 4002 2002"
    ///  let result = StringMasker.mask(string: string, with: "*")
    ///  // result will be 14003***********20024
    ///  ``` 
    ///
    /// - returns: a masked String
    public static func mask(string: String, with mask: String = StringMasker.defaultMask) -> String {
        if string.isEmpty { return string }
        if string.count == 1 { return mask }
        
        let half = string.count / 2
        let even = half % 2 == 0
        let rangeStart = string.index(string.startIndex, offsetBy: half/2)
        let rangeEnd = string.index(string.endIndex, offsetBy: -(half/2))
        let hideString = String(repeating: mask, count: half + (even ? 0 : 2))
        return string.replacingCharacters(in: rangeStart..<rangeEnd, with: hideString)
    }
}
