import Foundation

// TODO: use a struct to represent the core, immutable, bits of a creature, compose that with mutable bits such as calculated hps,
// inventory, etc.? Maybe different descriptions based on the room they appear in?
struct Creature {
    let id: Int
    var name: String
    var roomDescription: String
    var longDescription: String
    var size: Size
    var type: Type
    var alignment: Alignment
    var ac: Int
    var maxHitPoints: Int // TODO: probably calculate based on dice
    var speed: Speed // Should use movement points maybe instead? Subtract from moves based on terrain and speed?
    var strength: AbilityScore
    var dexterity: AbilityScore
    var constitution: AbilityScore
    var intelligence: AbilityScore
    var wisdom: AbilityScore
    var charisma: AbilityScore
    // TODO: saving throws vs specific effects
    var skills: [String] // TODO: handle skills for real, for now an array of their names will do?
    // TODO: handle proficiencies?
    // TODO: handle vulnerabilities, resistances, and immunities
    // TODO: handle senses, perception, blindsight, darkvision, truesight
    var languages: [String] // TODO: write some fake language stuff, for now just list the known languages
    var challenge: Float // TODO: calculate experience based on challenge rating?
    var traits: [Trait]
    var actions: [String] // TODO: eventually do things based on available actions, for now just list them.
    var damage: Dice // TODO: creatures have multiple ways of attack some of which are only valid in some circumstance. Model that somehow.
    var reactions: [String] // TODO: some mobs will have these, probably scripts.
    var limitedUsages: [String] // TODO: some special abilities (traits, actions, rxns) have restrictions on how often they can be used. They can also recharge, i.e.: "Recharge X-Y", roll a d6 every combat round, if the value is either X or Y the special ability can be used again. Should also recharge when out of combat for a period of time (10 ticks?).
}

enum Trait {
    case illumination(Int, Int)
    case magicResistance
    case rejuvenation
    case spell(Spell)

}

// TODO: not sure the best way to model this or how dynamic they should be. Many spells only
// make sense to be hard coded I think, while combat spells could probably easily be edited
// dynamically.
struct Spell {
    let name: String
    let level: Int // cantrip = 0, etc. TODO: what if two classes get the same spell at different levels?
}

struct AbilityScore {
    // TODO: Handle bonus calculations in here?
    var value: Int
    var ability: Ability

    enum Ability: String {
        case strength
        case dexterity
        case constitution
        case intelligence
        case wisdom
        case charisma
    }
}

enum Size {
    case tiny
    case small
    case medium
    case large
    case huge
}

enum Type {
    // TODO: handle type tags? Ignore them?
    case aberration
    case beast
    case dragon
    case giant
    case humanoid
    case monstrosity
    case ooze
    case plant
    case undead
}

enum Alignment {
    enum Morality {
        case good
        case neutral
        case evil
    }
    enum Order {
        case lawful
        case neutral
        case chaotic
    }

    case aligned(Morality, Order)
    case unaligned
}

struct Speed {
    let climb: Int
    let fly: Int
    let ground: Int
    let swim: Int

    func cost(for terrain: Terrain) -> Int {
        switch terrain {
        case .climb: return climb
        case .fly: return fly
        case .ground: return ground
        case .swim: return swim
        }
    }
}

enum Terrain {
    case climb
    case fly
    case ground
    case swim
}

struct Dice: CustomStringConvertible {
    let dice: Int
    let sides: Int
    let bonus: Int

    var roll: Int {
        [0...dice].reduce(into: 0) { acc, _ in
            acc += Int.random(in: 1...sides)
        } + bonus
    }

    var description: String {
        "\(dice)d\(sides)+\(bonus)"
    }
}
