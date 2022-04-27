//
//  MenuViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var howToView: UIView!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var assetButton: UIButton!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addStyleToComponents()
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
            self.clearButton,
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
        self.addRadiusToView(uiView: self.clearButton, radius: 20)
        self.addRadiusToView(uiView: self.startButton, radius: 20)
        
        self.addBorderToPlayerView()
        
        self.addStyleToPlayerButton()
    }
    
    // MARK: IBActions
    
    // MARK: Styling Component Methods
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    func addBorderToPlayerView() {
        guard let view = self.playerView else { return }
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(red: 0.192, green: 0.294, blue: 0.169, alpha: 1).cgColor
    }
    
    // TODO: Give highlight on [playerButton]
    func addStyleToPlayerButton() {
        guard let button = self.playerButton else { return }
        button.layer.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.392, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}

