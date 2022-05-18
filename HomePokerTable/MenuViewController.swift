//
//  MenuViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

// TODO: Add player asset setting ViewController that show up as modal with pickerView to set asset value manually, minimum button and maximum button, and some label to let user know how to use it.
// TODO: Asset value from min 5 to max 10000, in pickerView has interval 5.
// TODO: Player number from min 2 to max 8. Pick by pickerView or tap-increment.
class MenuViewController: UIViewController {

    // MARK: - Properties
    let segueIdentifierToMenuPlayerAssetViewController: String = "mpaSegue"
    let segueIdentifierToPlayerViewController: String = "startSegue"
    
    let playerNumbRange: [Int] = Array(2...8)
    var playerNumbRangeIndex: Int = 0
    var playerNumber: Int? {
        get {
            return playerNumbRange[playerNumbRangeIndex]
        }
    }
    var playerNumbForm: String? {
        get {
            return "x " + "\(playerNumber ?? 2)"
        }
    }
    var playerAsset: Int = 1000
    
    // MARK: IBOutlets
    @IBOutlet weak var howToView: UIView!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var assetButton: UIButton!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.numberButton.setTitle(self.playerNumbForm, for: .normal)
        self.assetButton.setTitle("\(self.playerAsset)", for: .normal)

        
        self.addStyleToComponents()
        
        // Add TapGestureRecognizer to playerView to show MenuPlayerAssetViewController
        let playerViewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchUpPlayerView(_:)))
        self.playerView.addGestureRecognizer(playerViewTapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.assetButton.setTitle("\(self.playerAsset)", for: .normal)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == segueIdentifierToMenuPlayerAssetViewController) {
            guard let vc = segue.destination as? MenuPlayerAssetViewController else { return }
            vc.delegate = self
            vc.playerAsset = self.playerAsset
        }
        else if (segue.identifier == segueIdentifierToPlayerViewController) {
            guard let vc = segue.destination as? PlayViewController else { return }
            vc.numberOfPlayers = self.playerNumber ?? 2
            vc.assetOfPlayers = self.playerAsset
        }
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    func addStyleToComponents() {
        
        // TODO: Which would be the better code to apply radius on views?
        
        // Option 1
        /*
        let addRadius20Views: Array = [
            self.playerView,
            self.numberButton,
            self.resetButton,
            self.startButton
        ]
        
        let styledViews: [()]
        styledViews = addRadius20Views.map { view in
            self.addRadiusToView(uiView: view, radius: 20)
        }
        
//        styledViews = addRadius20Views.map { self.addRadiusToView(uiView: $0, radius: 20) }
        print(styledViews.count)
        */
        
        // Option 2
        self.addRadiusToView(uiView: self.howToView, radius: 10)
        self.addRadiusToView(uiView: self.playerView, radius: 20)
        self.addRadiusToView(uiView: self.numberButton, radius: 20)
        self.addRadiusToView(uiView: self.resetButton, radius: 20)
        self.addRadiusToView(uiView: self.startButton, radius: 20)
        
        self.addBorderToPlayerView()
        
        self.addStyleToPlayerLabel()
    }
    
    // MARK: Component Styling Methods
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    func addBorderToPlayerView() {
        guard let view = self.playerView else { return }
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(red: 0.192, green: 0.294, blue: 0.169, alpha: 1).cgColor
    }
    
    func addStyleToPlayerLabel() {
        guard let button = self.playerLabel else { return }
        button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    // MARK: IBActions
    @IBAction func touchUpPlayerView(_ sender: Any) {
        
        // option 1 / NotWork
//        let rootVC = MenuPlayerAssetViewController()
//        let navVC = UINavigationController(rootViewController: rootVC)
//        present(navVC, animated: true, completion: nil)
        
        // option 2 / PrettyGood
//        let rootVC = storyboard?.instantiateViewController(withIdentifier: "mpaVC") as! MenuPlayerAssetViewController
//        present(rootVC, animated: true, completion: nil)
        
        // option 3 / WorkButUgly
//        let vc = storyboard?.instantiateViewController(withIdentifier: "mpaVC") as? MenuPlayerAssetViewController
//        view.window?.rootViewController = vc
//        view.window?.makeKeyAndVisible()
        
        // option 4 / PrettyGood
        performSegue(withIdentifier: "mpaSegue", sender: nil)
        
    }
    
    @IBAction func touchUpNumberButton(_ sender: Any) {
        if self.playerNumbRangeIndex < 6 {
            self.playerNumbRangeIndex += 1
        }
        else {
            self.playerNumbRangeIndex = 0
        }
        self.numberButton.setTitle(self.playerNumbForm, for: .normal)
    }
    
    @IBAction func touchUpResetButton(_ sender: Any) {
        self.playerNumbRangeIndex = 0
        self.playerAsset = 1000
        self.numberButton.setTitle(self.playerNumbForm, for: .normal)
        self.assetButton.setTitle("\(self.playerAsset)", for: .normal)
    }
    
}


extension MenuViewController: MenuPlayerAssetViewControllerDelegate {
    
    func callback(data: Int) {
        self.playerAsset = data
    }
    
}
