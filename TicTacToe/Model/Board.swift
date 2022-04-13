//
//  Board.swift
//  TicTacToe
//
//  Created by Nguyen NGO on 12/04/2022.
//

import Foundation
import UIKit

struct Board {
    var firstTurn = false
    var currentTurn = false
    var allCells = [UIButton]()
    
    mutating func createBoard(_ buttons: [UIButton?]) {
        for button in buttons {
            allCells.append(button!)
        }
    }
    
    func isFullBoard() -> Bool {
        for button in allCells {
            if (button.title(for: .normal) == nil) {
                return false
            }
        }
        return true
    }
    
    mutating func resetBoard() {
        for button in allCells {
            button.setTitle(nil, for: .normal)
        }

        firstTurn = !firstTurn
        currentTurn = firstTurn
    }
    
    // Add symbol on the board
    // triggered when tapping
    mutating func addToBoard(_ sender: UIButton,_ player1: Player,_ player2: Player) -> String {
        if (currentTurn == player1.turn) {
            sender.setTitle(player1.symbol, for: .normal)
            currentTurn = !player1.turn
            return player2.symbol
        } else {
            sender.setTitle(player2.symbol, for: .normal)
            currentTurn = !player2.turn
            return player1.symbol
        }
    }
    
    mutating func disableMultiTouch() {
        for button in allCells {
            button.isExclusiveTouch = true
        }
    }
    
}
