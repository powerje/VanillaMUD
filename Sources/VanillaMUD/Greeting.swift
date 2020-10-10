import Foundation

enum Greeting {
    static func writeGreeting(to connection: Connection) {
        connection.write("\(g1)\n")
        connection.write("Name: ")
    }
}

private let g1 =
"""
     N  O  R  T  H  E  R  N    C  R  O  S  S  R  O  A  D  S    M  U  D  D

                       -.            \\_|//            .-
                    ___-==_       _-~o~  \\/         _==-___
            __---~~~.==~||\\=_    -_--~/_-~|-      _=/||~==.~~~---__
        _-~~     .=~    |  \\\\-_    '-~7  /-     _-// |     ~=.     ~~-_
      .~       .~       |   \\\\ -_    /  /-    _- //  |        ~.       ~.
     /  ____  /         |     \\\\ ~-_/  /|- _-~ //    |          \\  ____  \

    |~~~    ~~|--~~~~--_ \\     ~==-/   | \\~-===~     / _--~~~~--|~~    ~~~|
                        ~-|      /|    |-~\\~        |-~       /\

                          |-~~-_/ \\     \\_ ~\\_---~~-|          \\_
                           _--~ __/| .-~ ___-~/                  ~~==.
"""
