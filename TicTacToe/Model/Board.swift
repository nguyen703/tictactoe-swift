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
    
}
