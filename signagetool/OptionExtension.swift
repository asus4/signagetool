//
//  OptionExtension.swift
//  signagetool
//
//  Created by Koki Ibukuro on 11/29/15.
//  Copyright © 2015 asus4. All rights reserved.
//

import Foundation



public class PointOption: Option {
    private var _value: CGPoint?

    public var value: CGPoint? {
        return _value
    }

    override public var wasSet: Bool {
        return _value != nil
    }

    override func setValue(values: [String]) -> Bool {
        if values.count != 2 {
            return false
        }

        guard let x = values[0].toDouble() else {
            return false
        }
        guard let y = values[1].toDouble() else {
            return false
        }
        _value = CGPointMake(CGFloat(x), CGFloat(y))
        return true
    }
}
