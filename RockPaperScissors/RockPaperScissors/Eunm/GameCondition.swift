enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

extension Player {
    var selection: String {
        switch self {
        case .user:
            return Player.user.rawValue
        case .computer:
            return Player.computer.rawValue
        }
    }
}

enum GameCondition: String {
    case end = "0"
}

enum GameResult: String {
    case draw = "비겼습니다."
    case win = "이겼습니다."
    case lose = "졌습니다."
    case end = "게임이 종료되었습니다."
}

enum RockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}
