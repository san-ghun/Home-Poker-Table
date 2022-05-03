//
//  MenuPlayerAssetViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 29.04.22.
//

import UIKit

class MenuPlayerAssetViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setAssetButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    func addStyleToComponents() {
        self.addRadiusToView(uiView: cancelButton, radius: 20)
        self.addRadiusToView(uiView: setAssetButton, radius: 20)
    }
    
    // MARK: Component Styling Methods
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    // MARK: IBActions

}
