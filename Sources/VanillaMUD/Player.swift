import Foundation

struct Player {
    private(set) weak var connection: Connection?
    let name: String
    let startRoomId = 0
    let state = PlayerState()
}

extension Player {
    func write(_ string: String) {
        connection?.write(string)
    }

    func writeln(_ string: String) {
        connection?.write("\(string)\n")
    }
}

class PlayerState {
    var roomId = -1
    var room: Room {
        guard let room = Room.roomMapping[roomId] else {
            return Room(id: -1, name: "Nowhere!", exits: [], extraDescriptions: [], longDescription: "How did you get here? This is literally nowhere!")
        }
        return room
    }
}
