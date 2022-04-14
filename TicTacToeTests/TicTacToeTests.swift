//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Nguyen NGO on 13/04/2022.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    var sut: ViewController!
    var boardCells = [UIButton?]()
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        boardCells = []
    }
    
    func testIfEachButtonHasActionAssigned() {
        
        var board: Board = sut.board
        var isConnected: Bool = false

        board.createBoard(boardCells)
        
        for button in board.allCells {
            guard let boardCellActions = button.actions(forTarget: sut, forControlEvent: .touchUpInside) else { return }
            isConnected = boardCellActions.contains("boardTapAction:")
            if (isConnected == false) { break }
        }
        
        XCTAssertTrue(isConnected)
    }
    
    func testIfBoardCreated() {
        var board: Board = sut.board

        board.createBoard(boardCells)
        
        XCTAssertFalse(board.allCells.isEmpty)
        
    }
    
    func testIfBoardIsClean() {
        var board: Board = sut.board
        var isCleaned = true
        
        board.resetBoard()
        
        for button in board.allCells {
            if (button.title(for: .normal) != nil) {
                isCleaned = false
                break
            }
        }
        
        XCTAssertTrue(isCleaned)
        
    }

}
