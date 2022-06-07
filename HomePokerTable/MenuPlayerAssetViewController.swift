//
//  MenuPlayerAssetViewController.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 29.04.22.
//

import UIKit

protocol MenuPlayerAssetViewControllerDelegate {
    func callback(data: Int)
}

class MenuPlayerAssetViewController: UIViewController {
    
    // MARK: - Properties
    let minAsset: Int = 1 * 5
    let maxAsset: Int = 2000 * 5
    let assetRange: [Int] = Array(1...2000).map {$0 * 5}
    var pickerData: [String] {
        get {
            return assetRange.map { String($0) }
        }
    }
    var playerAsset: Int = 1000
    
    var minAssetLabel: String? {
        get {
            return "Min.\n\(minAsset)"
        }
    }
    var maxAssetLabel: String? {
        get {
            return "Max.\n\(maxAsset)"
        }
    }
    
    var delegate: MenuPlayerAssetViewControllerDelegate?
    
    // MARK: IBOutlets
    @IBOutlet weak var minButton: UIButton!
    @IBOutlet weak var maxButton: UIButton!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setAssetButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.minButton.setTitle(minAssetLabel, for: .normal)
        self.maxButton.setTitle(maxAssetLabel, for: .normal)
        
        self.picker.delegate = self
        self.picker.dataSource = self
        if let row = pickerData.firstIndex(of: String(self.playerAsset)) {
            currentLabel.text = String(playerAsset)
            picker.selectRow(row, inComponent: 0, animated: false)
        }
        
        self.applyStyleToComponents()
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
        self.addRadiusToView(uiView: minButton, radius: 20)
        self.addRadiusToView(uiView: maxButton, radius: 20)
        self.addRadiusToView(uiView: cancelButton, radius: 20)
        self.addRadiusToView(uiView: setAssetButton, radius: 20)
    }
    
    func addRadiusToView(uiView: UIView?, radius: Int) {
        guard let view = uiView else { return }
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    // MARK: IBActions
    @IBAction func touchUpMinButton(_ sender: Any) {
        if let row = pickerData.firstIndex(of: String(self.minAsset)) {
            self.playerAsset = minAsset
            currentLabel.text = String(self.playerAsset)
            picker.selectRow(row, inComponent: 0, animated: true)
        }
    }
    
    @IBAction func touchUpMaxButton(_ sender: Any) {
        if let row = pickerData.firstIndex(of: String(self.maxAsset)) {
            self.playerAsset = maxAsset
            currentLabel.text = String(self.playerAsset)
            picker.selectRow(row, inComponent: 0, animated: true)
        }
    }
    
    @IBAction func touchUpCancelButton(_ sender: Any) {
        dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpSetAssetButton(_ sender: Any) {
        self.delegate?.callback(data: self.playerAsset)
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension MenuPlayerAssetViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let setValue = pickerData[row]
        self.currentLabel.text = setValue
        self.playerAsset = Int(setValue) ?? 1000
    }
    
}

extension MenuPlayerAssetViewController: UIPickerViewDataSource {
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}
