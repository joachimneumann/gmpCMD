//
//  main.swift.swift
//  SwiftGmpCMD
//
//  Created by Joachim Neumann on 27.09.24.
//

import Foundation
import SwiftGmp

let STD_ERR = FileHandle.standardError
let STD_OUT = FileHandle.standardOutput

func writeOut(_ message: String, _ targetFileHandle: FileHandle) {
    let messageAsString = message + "\r\n"
    if let messageAsData: Data = messageAsString.data(using: .utf8) {
        targetFileHandle.write(messageAsData)
    }
}
func writeToStderr(_ message: String) {
    let messageAsString = message + "\r\n"
    if let messageAsData: Data = messageAsString.data(using: .utf8) {
        STD_ERR.write(messageAsData)
    }
}

func writeToStdout(_ message: String) {
    writeOut(message, STD_OUT)
}


func version() {
    let version: String = "1.0.0"//Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let build: String = "1"//Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    let name:String = "gmpcmd"//Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    writeToStdout("\(name) \(version) (\(build))")
    writeToStdout("Copyright © 2024, Joachim Neumann.\r\nSource code available under the MIT licence.")
}

var cmdArgs = CommandLine.arguments
if cmdArgs.count == 1 {
    version()

    writeToStderr("ready to calculate:")
    var tokenizer = Tokenizer()

    while true {
        if let instr = readLine() {
            if instr.uppercased() == "EXIT" {
                exit(EXIT_SUCCESS)
            }
            do {
                let tokens = try tokenizer.parse(instr)
                if tokens.count > 0 {
                    writeToStdout("tokens.debugDescription")
                    writeToStdout(tokens.debugDescription)
                }
            } catch {
                if let error = error as? TokenizerError {
                    writeToStderr(error.localizedDescription)
                }
            }
        }
    }
    exit(EXIT_SUCCESS)
}
