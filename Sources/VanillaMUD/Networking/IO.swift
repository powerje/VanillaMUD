import Foundation
import TelnetKit

protocol IO: AnyObject {
    func read() -> String?
    @discardableResult func write(string: String) -> Bool
    var connected: Bool { get }
    func disconnect()
    func domain() -> String
    func ip() -> String
}

extension TelnetClient: IO {
    func read() -> String? {
        return readString()
    }
}

enum ConnectionState {
    case name
    case password(String)
    case playing(Player)
}

class Connection {
    var state = ConnectionState.name
    var input = Queue<String>()

    private let io: IO

    init(io: IO) {
        self.io = io
    }

    var connected: Bool { io.connected }
    var domain: String { io.domain() }
    func disconnect() { io.disconnect() }

    func dequeueInput() -> String? {
        input.dequeue()
    }

    func readInput() {
        guard let input = io.read() else { return }
        self.input.enqueue(input)
    }

    @discardableResult func write(_ string: String) -> Bool {
        io.write(string: string)
    }
}

extension Connection: Equatable {
    static func == (lhs: Connection, rhs: Connection) -> Bool {
        lhs.io === rhs.io
    }
}
