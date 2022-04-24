import Foundation

class RockPaperScissorsGame {
    var userNumber: RockPaperScissors = .rock
    var computerNumber: RockPaperScissors = .rock
    
    func startGame() {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
   
            if inputUserNumber() ?? nil == GameCondition.end.rawValue{
                print("게임이 종료되었습니다.")
                break
            } 
            selectRockPaperScissors()

            if setRockPaperScissorsRule(userValue: userNumber, computerValue: computerNumber) != .draw {
                break
            }
        }
    }
    
    func inputUserNumber() -> String? {
        guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces) else { return "재입력"}
        let userNumber = RockPaperScissors(rawValue: userInput)

        return userNumber?.rawValue ?? nil
    }
    
    func selectRockPaperScissors() {
        let numbers: [RockPaperScissors] = [.rock, .paper, .scissors]
        
        guard let choiceCase = numbers.randomElement() else { return }
        return computerNumber = choiceCase
    }
    
    func setRockPaperScissorsRule(userValue: RockPaperScissors, computerValue: RockPaperScissors) -> GameResult {
        switch (userValue, computerValue) {
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            print("이겼습니다!")
            MukjjibbaGame(winner: Player.user).startGame()
            return .win
            
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            print("졌습니다!")
            MukjjibbaGame(winner: Player.computer).startGame()
            return .lose
            
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            print("비겼습니다!")
            return .draw
        }
    }
}
