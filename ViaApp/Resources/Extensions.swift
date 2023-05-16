//
//  Extensions.swift
//  ViaApp
//
//  Created by Maikon Ferreira on 15/05/23.
//

import UIKit


extension String {
    func strikethrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, self.count))
        return attributeString
    }
}


