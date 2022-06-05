//
//  Player.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.05.22.
//

import Foundation

class Player {
    
    var number: Int = 0
    var name: String {
        get {
            return "Player \(number)"
        }
    }
    var bet: Int = 0
    var raise: Int = 0
    var asset: Int = 5
    var isSelected: Bool = false
    var isActive: Bool {
        get {
            asset > 0
        }
    }
    
}
