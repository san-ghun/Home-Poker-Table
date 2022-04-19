//
//  PlayViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.04.22.
//

import UIKit

/*
 TODO: Give highlight on player button
 TODO: Give radius on buttons and views
 TODO: Complete CollectionView and custom collectionViewCell
 */
class PlayViewController: UIViewController {

    // MARK: - Properties
    let cellIdentifier: String = "playerCell"
    
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
    
    // MARK: IBActions
    
}
