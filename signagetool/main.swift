//
//  main.swift
//  signagetool
//
//  Created by Koki Ibukuro on 11/28/15.
//  Copyright © 2015 asus4. All rights reserved.
//

import Foundation

enum Command: String {
    case Mouse = "mouse"
//    case Caffeine = "caffeine"
}

let cli = CommandLine()
let optCmd = EnumOption<Command>(shortFlag: "c", longFlag: "command", required: true,
    helpMessage: "Execute command - mouse for move mouse")
let optPosition = PointOption(shortFlag: "p", longFlag: "position",
    helpMessage: "CGPoint - position x y")

cli.addOptions(optCmd, optPosition)

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

// Command

switch optCmd.value! {
case Command.Mouse:
    if optPosition.value == nil {
        exit(EX_USAGE)
    }
    MouseControl.move(optPosition.value!)
}
