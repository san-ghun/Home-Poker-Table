//
//  PlayViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

/*
 TODO: Give highlight on player button
 TODO: Complete CollectionView and custom collectionViewCell
 */
class PlayViewController: UIViewController {

    // MARK: - Properties
    let cellIdentifier: String = "playerCell"
    var numberOfPlayers: Int = 2
    var assetOfPlayers: Int = 1000
    var potAmount: Int = 0
    
    let model = PlayerModel()
    var playersArray: [Player] = []
    
    // Indicate which player have selected
    var selectedPlayerIndex: IndexPath?
    
    // MARK: IBOutlets
    @IBOutlet weak var potAmountLabel: UILabel!
    @IBOutlet weak var awardButton: UIButton!
    @IBOutlet weak var playerCollectionView: UICollectionView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var chip005Button: UIButton!
    @IBOutlet weak var chip010Button: UIButton!
    @IBOutlet weak var chip050Button: UIButton!
    @IBOutlet weak var chip100Button: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Initiate pot value
        self.potAmountLabel.text = String(potAmount)
        
        // Set the players array
        playersArray = model.getPlayers(nop: numberOfPlayers, asset: assetOfPlayers)
        
        // Set the playerCollectionView
        self.setUpCollectionView()
        
        // Add style to components
        self.addStyleToComponents()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: Style UI components
    func addStyleToComponents() {
        self.addRadiusToView(uiView: self.awardButton, radius: 20)
        self.addRadiusToView(uiView: self.clearButton, radius: 20)
        self.addRadiusToView(uiView: self.betButton, radius: 20)
    }
    
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    // MARK: Set up CollectionView
    func setUpCollectionView() {
        
        // Replace to CollectionView Delegate method in extention, `func collectionView(..., willDisplay ...)`
        //playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        // Set the view controller as the dataSource and delegate of the collection view
        playerCollectionView.dataSource = self
        playerCollectionView.delegate = self
        
        let layout = generateLayout()
        
        playerCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // TODO: A method to Activate and Deactivate betButton
    func switchBetButton() {
        
    }
    
    
    // MARK: IBActions
    
    
}


// MARK: - Extensions

extension PlayViewController: UICollectionViewDataSource {
    
    // MARK: Collection View DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numberOfPlayers
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a cell
        guard let cell = playerCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PlayerCollectionViewCell else {
            fatalError("Could not create new cell")
        }
        
        // return Cell
        return cell
    }
    
}

extension PlayViewController: UICollectionViewDelegate {
    
    // MARK: Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // Configure the state of the cell based on the properties of the Player that it represents
        let playerCell = cell as? PlayerCollectionViewCell
        
        // Get the player from the player array
        let player = playersArray[indexPath.row]
        
        // Configure cell
        playerCell?.configureCell(player: player)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        /*
         * Don't forget to DISABLE the "User Interaction Enable" of wrapping View in playerCell at storyboard, by unchecking the selection.
         * So the collectionView didSelectItemAt method do not get bothered by the "User Interaction Enable" or GestureRecognizer features.
         * reference: [link](https:localcoder.org/why-uicollectionview-didselect-method-does-not-work)
         */
         
        // Get a reference to the cell that was tapped
        let cell = playerCollectionView.cellForItem(at: indexPath) as? PlayerCollectionViewCell

        // Check the status of the player to determine the selection
        if cell?.player?.isSelected == false && cell?.player?.isActive == true {

            // Select on the player
            cell?.selectOn()

            // Check if this is first player that was selected
            if selectedPlayerIndex != nil && selectedPlayerIndex != indexPath {

                // Get the collection view Cell that represent preSelected player
                guard let selectionIndex = selectedPlayerIndex else { fatalError("Could not get selected player indexPath") }
                let preSelectedPlayerCell = playerCollectionView.cellForItem(at: selectionIndex) as? PlayerCollectionViewCell

                preSelectedPlayerCell?.selectOff()
            }

            selectedPlayerIndex = indexPath
        }
        
    }
    
}
