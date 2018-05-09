//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by Rameses D Resuena on 2017-06-12.
//  Copyright © 2017 Rameses Resuena. All rights reserved.
//


/* 
Where I left off:

 - I need to re-locate buttons under different views (i.e. landscape)
*/
import UIKit

enum gameChoice {
    case Rock, Paper, Scissors
}

class GameViewController: UIViewController {
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var tieScoreLabel: UILabel!
    @IBOutlet weak var numberOfRoundsLabel: UILabel!
    
    var playerName = String()
    var playerScore = 0
    var computerScore = 0
    var playerChoice: gameChoice = gameChoice.Rock
    var computerChoice: gameChoice = gameChoice.Rock
    var winner = String()
    var status = String()
    var tieCount = 0
    var numberOfRoundsCount = 0
    
    @IBAction func gameButton (_ sender: UIButton) {
        switch sender.tag {
        case 1:
            playerChoice = .Rock
        case 2:
            playerChoice = .Paper
        case 3:
            playerChoice = .Scissors
        default:
            displayError()
        }
        computerChoice = getComputerChoice()
        playRound(playerChoice, computerChoice)
        displayAlert(title: status, message: "\(winner) won! Would you like to play again?")
        updateScoreboard()
    }
    
    func displayAlert(title: String, message: String) {
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        let endGameAction = UIAlertAction(title: "End Game", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "unwindSegue", sender: self)
        })
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        controller.addAction(playAgainAction)
        controller.addAction(endGameAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    func displayError() {
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        let controller = UIAlertController(title: "ERROR!", message: "Something went wrong", preferredStyle: .actionSheet)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    func getComputerChoice() -> gameChoice {
        let rnd = arc4random_uniform(3) + 1
        switch rnd {
        case 1:
            computerChoice = .Rock
        case 2:
            computerChoice = .Paper
        case 3:
            computerChoice = .Scissors
        default:
            displayError()
        }
        return computerChoice
    }
    
    func playRound(_ playerChoice: gameChoice, _ computerChoice: gameChoice) {
        if playerChoice == .Rock && computerChoice == .Scissors
            || playerChoice == .Paper && computerChoice == .Rock
            || playerChoice == .Scissors && computerChoice == .Paper {
            winner = "\(playerName)"
            status = "You Won!"
            playerScore += 1
            numberOfRoundsCount += 1
        } else if playerChoice == .Rock && computerChoice == .Rock
            || playerChoice == .Paper && computerChoice == .Paper
            || playerChoice == .Scissors && computerChoice == .Scissors {
            winner = "No one"
            status = "It was a Tie!"
            tieCount += 1
            numberOfRoundsCount += 1
        } else {
            winner = "Computer"
            status = "You Lost!"
            computerScore += 1
            numberOfRoundsCount += 1
        }
    }
    
    func updateScoreboard() {
        playerScoreLabel.text = "\(playerName): \(playerScore)"
        computerScoreLabel.text = "COMPUTER: \(computerScore)"
        tieScoreLabel.text = "TIES: \(tieCount)"
        numberOfRoundsLabel.text = "NUMBER OF ROUNDS: \(numberOfRoundsCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerScoreLabel.text = "\(playerName): \(playerScore)"
        updateScoreboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
