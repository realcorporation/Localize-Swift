//
//  NSString+Localize.swift
//  Localize_Swift
//
//  Created by Keith Chan on 9/3/2018.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation

/// tableName friendly extension
@objc
public extension NSString {
    
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString
     - Returns: The localized string.
     */
    func localized(comment: String?) -> String {
        return (self as String).localized(using: nil, in: .main)
    }
    
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString.
     
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter comment: The comment for developer, ignore in the function.
     
     - returns: The localized string.
     */
    func localized(using tableName: String?, comment: String?) -> String {
        return (self as String).localized(using: tableName, in: .main)
    }
    
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - parameter comment: The comment for developer, ignore in the function.
     
     - returns: The localized string.
     */
    func localized(in bundle: Bundle?, comment: String?) -> String {
        return (self as String).localized(using: nil, in: bundle)
    }
    
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString.
     
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - parameter comment: The comment for developer, ignore in the function.
     
     - returns: The localized string.
     */
    func localized(using tableName: String?, in bundle: Bundle?, comment: String?) -> String {
        let bundle: Bundle = bundle ?? .main
        if let path = bundle.path(forResource: Localize.currentLanguage(), ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: (self as String), value: nil, table: tableName)
        }
        else if let path = bundle.path(forResource: LCLBaseBundle, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: (self as String), value: nil, table: tableName)
        }
        return (self as String)
    }
}
