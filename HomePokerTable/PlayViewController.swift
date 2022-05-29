//
//  PlayViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

/*
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
    var selectedPlayerCell: PlayerCollectionViewCell?
    var selectedPlayer: Player?
    
    // MARK: IBOutlets
    @IBOutlet weak var potAmountLabel: UILabel!
    @IBOutlet weak var awardButton: UIButton!
    @IBOutlet weak var playerCollectionView: UICollectionView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var chipHStackView: UIStackView!
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
        self.applyStyleToComponents()
        
        // TODO: Add LongPressGestureRecognizer to chipHStackView to all-in
        let chipHStackViewLongPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressChipHStackView(_:)))
        self.chipHStackView.addGestureRecognizer(chipHStackViewLongPressGesture)
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
    
    // MARK: Methods to style UI components
    func applyStyleToComponents() {
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
        
        // Replace the following line of code to the CollectionView Delegate method in extention, `func collectionView(..., willDisplay ...)`
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
    func switchBetButton(player: Player) {
        if player.isActive {
            self.betButton.isEnabled = true
        }
        else {
            self.betButton.isEnabled = false
        }
    }
    
    
    // MARK: IBActions
    // TODO: touchUpAwardButton()
    @IBAction func touchUpAwardButton(_ sender: Any) {
        // temporary test to see the state change of player
        selectedPlayer?.asset += potAmount
        potAmount = 0
        playerCollectionView.reloadData()
    }
    // TODO: touchUpClearButton()
    @IBAction func touchUpClearButton(_ sender: Any) {
        
    }
    // TODO: touchUpBetButton()
    @IBAction func touchUpBetButton(_ sender: Any) {
        // temporary test to see the state change of player
        potAmount += selectedPlayer?.asset ?? 1000
        selectedPlayer?.asset = 0
        
        potAmountLabel.text = String(potAmount)
        playerCollectionView.reloadData()
    }
    // TODO: touchUpChip005()
    @IBAction func touchUpChip005(_ sender: Any) {
        
    }
    // TODO: touchUpChip010()
    @IBAction func touchUpChip010(_ sender: Any) {
        
    }
    // TODO: touchUpChip050()
    @IBAction func touchUpChip050(_ sender: Any) {
        
    }
    // TODO: touchUpChip100()
    @IBAction func touchUpChip100(_ sender: Any) {
        
    }
    // TODO: longPressChipHStackView() - all-in
    @IBAction func longPressChipHStackView(_ sender: Any) {
        
    }
    
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
        guard let cell = playerCollectionView.cellForItem(at: indexPath) as? PlayerCollectionViewCell else { fatalError("Could not get cell item") }
        
        // Get a reference to the player that cell have
        guard let player = cell.player else { fatalError("Could not get player from cell") }

        // Check the status of the player to determine the selection
        if player.isSelected == false {

            // Select on the player
            cell.selectOn()

            // Check if this is first player that was selected
            // if not, turn off the selection of previously selected cell
            if selectedPlayerIndex != nil && selectedPlayerIndex != indexPath {

                // Get the collection view Cell that represent preSelected player
                guard let selectionIndex = selectedPlayerIndex else { fatalError("Could not get selected player indexPath") }
                let preSelectedPlayerCell = playerCollectionView.cellForItem(at: selectionIndex) as? PlayerCollectionViewCell

                // Turn off the selection of preSelected player
                preSelectedPlayerCell?.selectOff()
            }

            // Set new selected player and player index
            selectedPlayer = player
            selectedPlayerCell = cell
            selectedPlayerIndex = indexPath
            
        }
        
        // Set the Bet button activation
        switchBetButton(player: player)
        
    }
    
}
