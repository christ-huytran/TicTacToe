//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Huy Tran on 11/11/15.
//  Copyright © 2015 Chris Tran. All rights reserved.
//

import Foundation

class TicTacToeGame {
    var gameBoard: [Int]
    var gameOver: Bool
    var winner: String?
    var currentTurn: String
    
    init() {
        gameBoard = [0,0,0,
                     0,0,0,
                     0,0,0]
        gameOver = false
        currentTurn = "Red"
    }
    
    func updateGameBoardAt(index: Int, withColor: String) {
        if withColor == "Red" {
            gameBoard[index] = 1
        } else {
            gameBoard[index] = 2
        }
    }
    
    func updateTurn() {
        if currentTurn == "Red" {
            currentTurn = "Blue"
        } else {
            currentTurn = "Red"
        }
    }
    
    func resetGame() {
        gameBoard = [0,0,0,
            0,0,0,
            0,0,0]
        gameOver = false
    }
    
    func checkGame() {
        checkRows()
        checkColumns()
        checkDiagonals()
    }
    
    func checkRows() {
        for var i = 0; i <= 6; i += 3 {
            if gameBoard[i] != 0 && gameBoard[i] == gameBoard[i+1] && gameBoard[i+1] == gameBoard[i+2] {
                declareWinner(gameBoard[i])
            }
        }
    }
    
    func checkColumns() {
        for var i = 0; i < 3; i++ {
            if gameBoard[i] != 0 && gameBoard[i] == gameBoard[i+3] && gameBoard[i+3] == gameBoard[i+6] {
                declareWinner(gameBoard[i])
            }
        }
    }
    
    func checkDiagonals() {
        if gameBoard[4] != 0 && (leftDiagonal() || rightDiagonal()) {
            declareWinner(gameBoard[4])
        }
    }
    
    func leftDiagonal() -> Bool {
        return gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]
    }
    
    func rightDiagonal() -> Bool {
        return gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]
    }
    
    func declareWinner(winningIdx: Int) {
        gameOver = true
        if winningIdx == 1 {
            winner = "Red"
        } else {
            winner = "Blue"
        }
    }
}