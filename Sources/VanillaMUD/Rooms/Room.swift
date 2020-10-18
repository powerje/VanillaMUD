import Foundation

struct Room: Describable {
    let id: Int
    var name: String
    var exits: [Exit]
    var extraDescriptions: [ExtraDescription]
    var longDescription: String
    var shortDescription: String
}

struct Exit {
    var direction: Direction
    var generalDescription: String
    var keywords: [String]
    var flag: Int
    var key: Int
}

enum Direction: Describable {
    case north(Room)
    case east(Room)
    case south(Room)
    case west(Room)
    case up(Room)
    case down(Room)

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
