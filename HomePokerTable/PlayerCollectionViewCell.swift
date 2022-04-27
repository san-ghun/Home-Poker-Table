//
//  PlayerCollectionViewCell.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 19.04.22.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var playerCellView: UIView!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var assetButton: UIButton!
    
    
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
     
    func addStyleToPlayerButton() {
        guard let button = self.playerButton else { return }
        button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    */
    
    // TODO: A method to Activate and Deactivate playerButton
    func switchPlayerButton() {
        
    }
}
