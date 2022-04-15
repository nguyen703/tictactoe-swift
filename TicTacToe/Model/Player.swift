//
//  Player.swift
//  TicTacToe
//
//  Created by Nguyen NGO on 12/04/2022.
//

import Foundation

struct Player {
    var score = 0
    var symbol: String
    var turn: Bool
    
    mutating func addScore() {
        score += 1
    }
    
}
