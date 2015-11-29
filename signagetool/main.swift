//
//  main.swift
//  signagetool
//
//  Created by Koki Ibukuro on 11/28/15.
//  Copyright © 2015 asus4. All rights reserved.
//

import Foundation

func MouseCommand() -> CommandType {
    let cmd = LightweightCommand(commandName: "mouse")
    cmd.commandShortDescription = "Control mouse"
    cmd.commandSignature = "<x> <y>"

    var isLeftClick = false
    var isRightClick = false

    cmd.optionsSetupBlock = {(options) in
        options.onFlags(["--click"], usage: "Execute left click") {(flag) in
            isLeftClick = true
        }
        options.onFlags(["--rclick"], usage: "Execute right click") {(flag) in
            isRightClick = true
        }
    }
    cmd.executionBlock = {(arguments) in
        guard let x = arguments.requiredArgument("x").toDouble() else {
            printError("Expected x is double")
            exit(EX_USAGE)
        }
        guard let y = arguments.requiredArgument("y").toDouble() else {
            printError("Expected y is double")
            exit(EX_USAGE)
        }
        if isLeftClick {
            MouseControl.click(CGPoint(x: x, y: y))
        } else if isRightClick {
            MouseControl.clickRight(CGPoint(x: x, y: y))
        } else {
            MouseControl.move(CGPoint(x: x, y: y))
        }
    }
    return cmd
}


// MARK: - main

CLI.setup(name: "signage-tool", version: "0.1", description: "Command line tools for OSX Signage")
CLI.registerCommand(MouseCommand())

let result = CLI.go()
exit(result)
