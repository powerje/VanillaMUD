import Foundation

extension String {
    var substrings: [String] { components(separatedBy: CharacterSet.whitespaces) }
}
