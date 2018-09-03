import Foundation
import TelnetKit

class MUDServer {

    var connections = [Connection]()

    func serve() {
        print("Starting server...")
        let server = TelnetServer() { [unowned self] in
            self.addConnection(connection: $0)
        }
        DispatchQueue.global().async { server.serve() }

        while true {
            self.gameLoop()
            usleep(500000)
        }
    }

    private func gameLoop() {
        print("loopin'")
    }

    private func addConnection(connection: Connection) {
        connections.append(connection)
        while connection.connected {
            if let input = connection.read() {
                if input.trimmingCharacters(in: .whitespacesAndNewlines) == "quit" {
                    connection.write(string: "buh bye!\n")
                    connection.disconnect()
                } else if input.trimmingCharacters(in: .whitespacesAndNewlines) == "shutdown" {
                    exit(0)
                } else {
                    self.echoAll(from: connection, message: input)
                }
            }
        }
        for (index, other) in connections.enumerated() {
            if other === connection {
                connections.remove(at: index)
                break
            }
        }
    }

    private func echoAll(from connection: Connection, message: String) {
        for connection in connections {
            connection.write(string: "\(connection.domain()): \(message)")
        }
    }

}

