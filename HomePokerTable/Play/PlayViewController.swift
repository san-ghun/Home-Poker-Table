//
//  PlayViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

class PlayViewController: UIViewController {

    // MARK: - Properties
    let cellIdentifier: String = "playerCell"
    var numberOfPlayers: Int = 2
    var assetOfPlayers: Int = 1000
    var potAmount: Int = 0
    
    let model = PlayerModel()
    var playersArray: [Player] = []
    
    // Indicate which cell and player have selected
    var selectedPlayerIndex: IndexPath?
    var selectedPlayerCell: PlayerCollectionViewCell?
    var selectedPlayer: Player?
    
    // MARK: IBOutlets
    @IBOutlet weak var potAmountLabel: UILabel!
    @IBOutlet weak var winButton: UIButton!
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
        
        // Add UIBarButtons with action
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(touchUpDoneButton(_:)))
        // TODO: Add edit button
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchUpEditButton(_:)))
        
        // Initiate pot value
        self.potAmountLabel.text = String(potAmount)
        
        // Set the players array
        playersArray = model.getPlayers(nop: numberOfPlayers, asset: assetOfPlayers)
        
        // Set the playerCollectionView
        self.setUpCollectionView()
        
        // Add style to components
        self.applyStyleToComponents()
        
        // Add LongPressGestureRecognizer to chipHStackView to perform all-in
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
    
    /// A method to Activate and Deactivate betButton
    func switchBetButton(player: Player?) {
        guard let player = player else {
            self.betButton.alpha = 0.5
            self.betButton.isEnabled = false
            return
        }
        if player.isActive && (player.raise > 0) {
            self.betButton.alpha = 1
            self.betButton.isEnabled = true
        }
        else {
            self.betButton.alpha = 0.5
            self.betButton.isEnabled = false
        }
    }
    
    /// A method to initiate bets of players to zero, after the win
    func initiateBets() {
        guard !playersArray.isEmpty else { return }
        playersArray = playersArray.map({ (player: Player) -> Player in
            player.bet = 0
            player.raise = 0
            return player
        })
    }
    
    /// A method that check the asset of player and automatically set the betting value to the proper value
    func validateAsset(player: Player, chip: Int) {
        
        // validate asset of player is affordable to bet
        if player.bet + player.raise + chip <= player.asset {
            player.raise += chip
        }
        else {
            player.raise = player.asset - player.bet
        }
    }
    
    /// A method show alert with input message
    func showAlert(message: String) {
        
        //guard let player = selectedPlayer else { return }
        
        // Create alert
        let alert = UIAlertController(title: "Confirm the Bet", message: message, preferredStyle: .alert)
        
        // Configure button handler
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        // Add button
        alert.addAction(okButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Methods to style UI components
    func applyStyleToComponents() {
        self.addRadiusToView(uiView: self.winButton, radius: 20)
        self.addRadiusToView(uiView: self.clearButton, radius: 20)
        self.addRadiusToView(uiView: self.betButton, radius: 20)
    }
    
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    // MARK: Methods to set up CollectionView
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
    
    
    // MARK: IBActions
    @IBAction func touchUpDoneButton(_ sender: Any) {
        
        // Create alert
        let alert = UIAlertController(title: "Closing Game", message: "Will you close game?", preferredStyle: .alert)
        
        // Configure button handler
        let closeButton = UIAlertAction(title: "Confirm", style: .destructive) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        
        // Add buttons
        alert.addAction(closeButton)
        alert.addAction(cancelButton)
        
        // Show alert
        self.present(alert, animated: true)
    }
    
    // TODO: @IBAction touchUpEditButton() to edit selected player data
    @IBAction func touchUpEditButton(_ sender: Any) {
        
    }
    
    @IBAction func touchUpWinButton(_ sender: Any) {
        
        let unresolvedPlayersArray: [Player] = playersArray.filter { $0.raise != 0 }
        if !unresolvedPlayersArray.isEmpty {
            let message = "Player didn't confirm the bet"
            showAlert(message: message)
            return
        }
        
        let betsArray: [Int] = playersArray.map { $0.bet }
        let assetsArray: [Int] = playersArray.map { $0.asset }
        let resultsArray: [Int] = zip(assetsArray, betsArray).map { $0 - $1 }
        
        playersArray = zip(playersArray, resultsArray).map({ (player: Player, result: Int) -> Player in
            player.asset = result
            return player
        })
        
        guard let player = selectedPlayer else { return }
        player.asset += potAmount
        
        potAmount = 0
        potAmountLabel.text = String(potAmount)
        
        initiateBets()
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpClearButton(_ sender: Any) {
        
        guard let player = selectedPlayer else { return }
        
        player.raise = 0
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpBetButton(_ sender: Any) {
        
        guard let player = selectedPlayer else { return }
        
        let raiseValue: Int = player.raise
        
        potAmount += raiseValue
        potAmountLabel.text = String(potAmount)
        
        player.bet += player.raise
        player.raise = 0
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpChip005(_ sender: Any) {
        
        let chipValue: Int = 5
        
        guard let player = selectedPlayer else { return }
        
        validateAsset(player: player, chip: chipValue)
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpChip010(_ sender: Any) {
        
        let chipValue: Int = 10
        
        guard let player = selectedPlayer else { return }
        
        validateAsset(player: player, chip: chipValue)
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpChip050(_ sender: Any) {
        
        let chipValue: Int = 50
        
        guard let player = selectedPlayer else { return }
        
        validateAsset(player: player, chip: chipValue)
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func touchUpChip100(_ sender: Any) {
        
        let chipValue: Int = 100
        
        guard let player = selectedPlayer else { return }
        
        validateAsset(player: player, chip: chipValue)
        
        switchBetButton(player: player)
        
        playerCollectionView.reloadData()
    }
    
    @IBAction func longPressChipHStackView(_ sender: Any) {
        
        guard let player = selectedPlayer else { return }
        
        // Create alert
        let alert = UIAlertController(title: "Big Raise", message: "Specify raise or All-in!", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        // Configure button handler
        let raiseButton = UIAlertAction(title: "Raise", style: .default) { (action) in
            
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            let raiseInput = textfield.text
            
            // Adjust the player's raise
            var adjustedRaiseInput: String {
                
                guard let raiseInput = raiseInput else {
                    fatalError("Could not get textfield value")
                }
                
                if raiseInput.isEmpty {
                    return "0"
                }
                else if raiseInput.last == "5" {
                    return raiseInput
                }
                
                var adjusted: String = "0"
                
                guard let lastDigit: Int = raiseInput.last!.wholeNumberValue else { fatalError("Could not get last digit of raise") }
                
                if lastDigit / 5 == 1 {
                    adjusted = raiseInput.dropLast()+"5"
                } else {
                    adjusted = raiseInput.dropLast()+"0"
                }
                
                return adjusted
            }
            
            // Convert type of raise from String to Int
            guard let raise = Int(adjustedRaiseInput) else { fatalError("Could not get raise value")}
            
            // Check the player's raise and bet is valid
            self.validateAsset(player: player, chip: raise)

            self.switchBetButton(player: player)
            self.playerCollectionView.reloadData()
        }
        
        let allinButton = UIAlertAction(title: "All-in", style: .destructive) { (action) in
            
            // Set the raise of player to maximum for player
            player.raise = player.asset - player.bet
            
            self.switchBetButton(player: player)
            self.playerCollectionView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add buttons
        alert.addAction(raiseButton)
        alert.addAction(allinButton)
        alert.addAction(cancelButton)
        
        // show alert
        self.present(alert, animated: true)
        
        switchBetButton(player: player)
        playerCollectionView.reloadData()
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
        
        dump(player)
        
        // Check the status of the player to determine the selection
        if player.isSelected == false {
            
            // Check if this is first player that was selected
            // if not, check the previously selected player left some raise value not bet, and if not, turn off the selection of previously selected cell
            if selectedPlayerIndex != nil && selectedPlayerIndex != indexPath {
                
                // Get the Player instance that represent preSelected player
                guard let preSelectedPlayer = selectedPlayer else { fatalError("Could not get pre-selected player") }
                
                // Check preSelected player left some raise value
                if preSelectedPlayer.raise != 0 {
                    
                    // if there some left raise value, show alert and return the method
                    let message = "\(preSelectedPlayer.name) didn't confirm the bet"
                    showAlert(message: message)
                    return
                }
                
                // Turn off the selection of preSelected player
                preSelectedPlayer.isSelected = false
            }
            
            // Select on the player
            player.isSelected = true
            
            // Set new selected player and player index
            selectedPlayer = player
            selectedPlayerCell = cell
            selectedPlayerIndex = indexPath
            
        }
//        else {
//            player.isSelected = false
//
//            selectedPlayer = nil
//            selectedPlayerCell = nil
//            selectedPlayerIndex = nil
//        }
        
        // Set the Bet button activation
        switchBetButton(player: selectedPlayer)
        
        // Reload the collection view
        playerCollectionView.reloadData()
    }
    
}
