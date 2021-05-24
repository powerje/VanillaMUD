import Foundation

extension Room {

    // TODO: should normalize Player / Creature to Creature protocol?
    static func move(_ player: Player, to roomId: Int) {
        player.state.roomId = roomId
        guard let room = Room.roomMapping[roomId] else {
            return player.write("You are nowhere!")
        }
        player.writeln(room.name)
        player.writeln(room.longDescription)
        player.writeln("Obvious Exits: \(room.exits.map { $0.direction.longDescription }.joined(separator: " "))")
        // Look up objects/players/mobs in the room and list them.
    }

    func move(_ player: Player, direction: Direction) {
        
    }
}
