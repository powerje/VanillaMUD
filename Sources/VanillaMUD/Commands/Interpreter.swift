import Foundation

struct Interpreter {
    func interpret(input: String, for player: Player) {
        let command = input.substrings[0]
        // let subcommands = Array(input.substrings.dropFirst())
        switch command {
        case "north":
            break
        case "east":
            break
        case "south":
            break
        case "west":
            break
        default:
            player.writeln("What do you mean?")
        }
    }
}
