import Foundation
import Willow

let log = Logger(logLevels: [.all], writers: [ConsoleWriter()])

func main() {
    let server = MUDServer()
    server.serve()
}

main()
