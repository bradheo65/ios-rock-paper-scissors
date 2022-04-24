import Darwin
class MukjjibbaGame: RockPaperScissorsGame {
    
    var winner: String = ""
    
    init(winner: Player) {
         self.winner = winner.rawValue
    }

    func currentTurn() -> String {
        if winner == Player.user.selection {
            return Player.user.selection
        } else {
            return Player.computer.selection
        }
    }

    override func startGame() {
        while true {
            print("[\((currentTurn())) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            
            if inputUserNumber() ?? nil == GameCondition.end.rawValue {
                print("게임이 종료되었습니다.")
                break
            }
            selectRockPaperScissors()
            
            if setMukjjibbaRule(userValue: userNumber, computerValue: computerNumber) == .draw {
                print("\(currentTurn())의 승리입니다.")
                break
            }
        }
    }

    func setMukjjibbaRule(userValue: RockPaperScissors, computerValue: RockPaperScissors) -> GameResult {
        switch (computerValue, userValue) {
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            winner = Player.user.rawValue
            return .win
            
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            winner = Player.computer.rawValue
            return .lose
            
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            return .draw
        }
    }
}
