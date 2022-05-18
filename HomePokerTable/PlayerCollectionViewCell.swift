//
//  PlayerCollectionViewCell.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 19.04.22.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var player: Player?
    
    // MARK: IBOutlets
    @IBOutlet weak var playerCellView: UIView!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var assetButton: UIButton!
    
    
    // MARK: - Methods
    func configureCell(player: Player) {
        
        // Keep track of the player this cell represents
        self.player = player
        
        // Set the title and label to the view the represents the player
        playerButton.setTitle(player.name, for: .normal)
        assetButton.setTitle(String(player.asset), for: .normal)
        
        // Give Style to cell
        self.addRadiusToView(uiView: playerCellView, radius: 20)
        self.addBorderToPlayerView()
        self.addStyleToPlayerButton()
        
    }
    // TODO: Give radius and border to CollectionViewCell
    /*
     as Reference
     
     func addRadiusToView(uiView: UIView?, radius: Int) {
         guard let view = uiView else { return }
         view.layer.cornerRadius = CGFloat(radius)
     }
     
     func addBorderToPlayerView() {
         guard let view = self.playerView else { return }
         view.layer.borderWidth = 3
         view.layer.borderColor = UIColor(red: 0.192, green: 0.294, blue: 0.169, alpha: 1).cgColor
     }
     */
    
    // TODO: Give highlight on [playerButton]
    /*
     as Reference
     
    func addStyleToPlayerLabel() {
        guard let button = self.playerButton else { return }
        button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    */
    
    // MARK: Component Styling Methods
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    func addBorderToPlayerView() {
        guard let view = self.playerCellView else { return }
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(red: 0.192, green: 0.294, blue: 0.169, alpha: 1).cgColor
    }
    
    func addStyleToPlayerButton() {
        guard let button = self.playerButton else { return }
        //button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func selectOn() {
        guard let button = self.playerButton else { return }
        button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        player?.isSelected = true
    }
    
    func selectOff() {
        guard let button = self.playerButton else { return }
        button.layer.backgroundColor = .none
        player?.isSelected = false
    }
    
    // TODO: A method to Activate and Deactivate playerButton
    func switchPlayerButton() {
        
    }
}
