//
//  MouseControl.swift
//  signagetool
//
//  Created by Koki Ibukuro on 11/28/15.
//  Copyright © 2015 asus4. All rights reserved.
//

import Foundation

public struct MouseControl {

    private static func mouseEvent(type: CGEventType, point: CGPoint) {
        let event = CGEventCreateMouseEvent(nil, type, point, CGMouseButton.Left)
        CGEventPost(CGEventTapLocation.CGHIDEventTap, event)
    }

    public static func move(point: CGPoint) {
        mouseEvent(CGEventType.MouseMoved, point: point)
    }

    public static func click(point: CGPoint) {
        mouseEvent(CGEventType.LeftMouseDown, point: point)
        mouseEvent(CGEventType.LeftMouseUp, point: point)
    }

    public static func clickRight(point: CGPoint) {
        mouseEvent(CGEventType.RightMouseDown, point: point)
        mouseEvent(CGEventType.RightMouseUp, point: point)
    }
}
