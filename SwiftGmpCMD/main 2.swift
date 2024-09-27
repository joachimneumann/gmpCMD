//
//  main.swift
//  SwiftGmpCMD
//
//  Created by Joachim Neumann on 26.09.24.
//
/*
import Foundation
import SwiftGmp

let STD_ERR = FileHandle.standardError
let STD_OUT = FileHandle.standardOutput
let RED    = "\u{001B}[31m"
let YELLOW = "\u{001B}[33m"
let RESET  = "\u{001B}[0m"
let BOLD   = "\u{001B}[1m"
let ITALIC = "\u{001B}[3m"

print("Hello, World!")

let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

print("swiftGmp Verions \(version)")

func writeToStderr(_ message: String) {
    let messageAsString = message + "\r\n"
    if let messageAsData: Data = messageAsString.data(using: .utf8) {
        STD_ERR.write(messageAsData)
    }
}

func reportErrorAndExit(_ message: String, _ code: Int32 = EXIT_FAILURE) {
    writeToStderr(RED + BOLD + "ERROR " + RESET + message + " -- exiting")
    exit(code)
}

signal(SIGINT) {
    theSignal in
        let bsp = String(UnicodeScalar(8))
        writeToStderr("(bsp)(bsp)\rapplication interrupted -- halting")
        exit(EXIT_FAILURE)
}
 */
