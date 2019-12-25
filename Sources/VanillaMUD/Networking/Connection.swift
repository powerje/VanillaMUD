//
//  Connection.swift
//  Socket
//
//  Created by James Power on 9/2/18.
//

import Foundation
import TelnetKit

protocol Connection: AnyObject {
    func read() -> String?
    @discardableResult func write(string: String) -> Bool
    var connected: Bool { get }
    func disconnect()
    func domain() -> String
    func ip() -> String
}

extension TelnetClient: Connection {
    func read() -> String? {
        return readString()
    }
}
