import Foundation
import TelnetKit

class MUDServer {

    private static let port = 9000
    @Atomic private (set) var connections = [Connection]()
    var players: [Player] {
        connections.compactMap {
            if case let .playing(player) = $0.state { return player }
            return nil
        }
    }
    private (set) var running = true

    func serve() {
        print("Starting server on port \(MUDServer.port)")
        let server = TelnetServer(port: MUDServer.port) { [unowned self] in
            self.addConnection(connection: Connection(io: $0))
        }
        DispatchQueue.global().async { server.serve() }

        var pulse = 0
        while running {
            self.gameLoop()
            pulse += 1
            usleep(50000)
            // ~30 seconds
            pulse %= 600
        }

        print("Shuting down normally.")
    }

    private func gameLoop() {
        handleInput()
    }

    private func handleInput() {
        for connection in connections {
            guard let input = connection.dequeueInput() else { continue }
            switch connection.state {
            case .name:
                // TODO: validate players existence and determine whether or not to create
                // a new character or attempt to log in with this one.
                connection.state = .password(input.trimmed)
                connection.write("Password: ")
            case let .password(name):
                let player = Player(connection: connection, name: name)
                print("Logging in with password: \(input.trimmed)")
                connection.state = .playing(player)
                Room.move(player, to: player.startRoomId)
            case let .playing(player):
                let command = input.trimmed
                print("COMMAND: \(command)")
                if command == "quit" {
                    player.write("buh bye!\n")
                    connection.disconnect()
                } else if command == "shutdown" {
                    player.write("RIP\n")
                    echoAll("Shutdown by \(player.name)")
                    self.running = false
                } else {
                    self.echoAll("<\(player.name)> \(input)")
                }
            }
        }
    }

    private func addConnection(connection: Connection) {
        $connections.mutate { $0.append(connection) }
        Greeting.writeGreeting(to: connection)
        while connection.connected {
            connection.readInput()
        }
        for (index, other) in connections.enumerated() {
            if other == connection {
                $connections.mutate { $0.remove(at: index) }
                break
            }
        }
    }

    private func echoAll(_ message: String) {
        for connection in connections {
            connection.write(message)
        }
    }
}

private extension String {
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
