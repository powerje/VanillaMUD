import Foundation

struct Player {
    private(set) weak var connection: Connection?
    let name: String
}

extension Player {
    func write(string: String) {
        connection?.write(string)
    }
}
