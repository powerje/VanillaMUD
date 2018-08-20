import Foundation
import TelnetKit

class MUDServer {

    func serve() {
        print("Starting server...")
        let server = Server() { [unowned self] in
            self.beginEcho(client: $0)
        }
        server.serve()
    }

    private func beginEcho(client: Client) {
        while client.connected {
            if let input = client.read() {
                if input.trimmingCharacters(in: .whitespacesAndNewlines) == "quit" {
                    client.write(string: "buh bye!\n")
                    client.disconnect()
                } else {
                    client.write(string: input)
                }
            }
        }
    }

}
