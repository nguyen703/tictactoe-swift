//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nguyen NGO on 11/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var board = Board()
    var player1 = Player(symbol: "O", turn: true)
    var player2 = Player(symbol: "X", turn: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this line avoid error "Attempt to present ... which is already presenting
        definesPresentationContext = true
        
        // init first turn when Opening app
        board.firstTurn = player1.turn
        board.currentTurn = player1.turn
        let boardCells = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
        
        // parse all the buttons to the board array
        board.createBoard(boardCells)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            turnLabel.text = board.addToBoard(sender, player1, player2)
        }
        
        if checkForVictory(player1.symbol) {
            player1.score += 1
            resultAlert(title: "\(player1.symbol) Win!")
            turnLabel.text = player2.symbol
        }
        
        if checkForVictory(player2.symbol) {
            player2.score += 1
            resultAlert(title: "\(player2.symbol) Win!")
            turnLabel.text = player1.symbol
        }
        
        if board.isFullBoard() {
            resultAlert(title: "Draw!")
        }
    }
    
//MARK: - Functions area
    
    // show alert when game finished
    func resultAlert(title: String) {
        let message = "\n\(player1.symbol) score:  \(String(player1.score))\n\n\(player2.symbol) score:  \(String(player2.score))"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.board.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    // check possible winning cases
    func checkForVictory(_ s: String) -> Bool {
        
        // Horizontal Win
        if (thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)) {
            return true
        }
        if (thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)) {
            return true
        }
        if (thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)) {
            return true
        }
        
        // Vertical Win
        if (thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)) {
            return true
        }
        if (thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)) {
            return true
        }
        if (thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)) {
            return true
        }
        
        // Diagonal Win
        if (thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)) {
            return true
        }
        if (thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)) {
            return true
        }

        
        return false
    }
    
    // compare button title with play's symbol
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
}

