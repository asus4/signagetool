//
//  StringExtensions.swift
//  signagetool
//
//  Created by Koki Ibukuro on 11/29/15.
//  Copyright © 2015 asus4. All rights reserved.
//

import Darwin

internal extension String {
    func toDouble() -> Double? {
        errno = 0
        let f = atof(self)
        if errno != 0 {
            return nil
        }
        return f
    }
}
