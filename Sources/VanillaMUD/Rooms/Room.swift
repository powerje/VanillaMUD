import Foundation

struct Room {
    let id: Int
    var name: String
    var exits: [Exit]
    var extraDescriptions: [ExtraDescription]
    var longDescription: String

    private static let rooms = [
        Room(id: 0, name: "The Void 0", exits: [.init(direction: .north, roomId: 1, generalDescription: "", keywords: [], door: nil),
                                                .init(direction: .east, roomId: 2, generalDescription: "", keywords: [], door: nil),
                                                .init(direction: .south, roomId: 3, generalDescription: "", keywords: [], door: nil),
                                                .init(direction: .west, roomId: 4, generalDescription: "", keywords: [], door: nil),
                                                .init(direction: .up, roomId: 5, generalDescription: "", keywords: [], door: nil),
                                                .init(direction: .down, roomId: 6, generalDescription: "", keywords: [], door: nil),],
             extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 1, name: "The Void 1", exits: [.init(direction: .south, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 2, name: "The Void 2", exits: [.init(direction: .west, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 3, name: "The Void 3", exits: [.init(direction: .north, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 4, name: "The Void 4", exits: [.init(direction: .east, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 5, name: "The Void 5", exits: [.init(direction: .down, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
        Room(id: 6, name: "The Void 6", exits: [.init(direction: .up, roomId: 0, generalDescription: "", keywords: [], door: nil)], extraDescriptions: [], longDescription: "You are floating in a formless void."),
    ]
    static let roomMapping = Room.rooms.reduce(into: [Int: Room]()) { rooms, room in rooms[room.id] = room }
}

struct Exit {
    var direction: Direction
    var roomId: Int
    var generalDescription: String
    var keywords: [String]
    var door: Door?
}

struct Door {
    var key: Int
}

enum Direction: Describable {
    case north
    case east
    case south
    case west
    case up
    case down

    var longDescription: String {
        switch self {
        case .north: return "North"
        case .east: return "East"
        case .south: return "South"
        case .west: return "West"
        case .up: return "Up"
        case .down: return "Down"
        }
    }

    var shortDescription: String {
        switch self {
        case .north: return "N"
        case .east: return "E"
        case .south: return "S"
        case .west: return "W"
        case .up: return "U"
        case .down: return "D"
        }
    }
}

struct ExtraDescription {
    var keywords: [String]
    var description: String
}

protocol Describable {
    var longDescription: String { get }
    var shortDescription: String { get }
}


