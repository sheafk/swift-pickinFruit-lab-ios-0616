//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var numberOfComponents = 3 //The number 3 was set by the requirments of this lab
    var rowsInt = 1000
    
    
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        self.fruitPicker.delegate = self;
        self.fruitPicker.dataSource = self;
        self.pickFruit()
        
        for i in 0..<self.numberOfComponents {
            self.fruitPicker.selectRow(rowsInt/2, inComponent: i, animated: true)
        }
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        self.pickFruit()
    }
    
    //conform to PROTOCOLS
    func pickerView(pickerView: UIPickerView, titleForRow row:Int, forComponent: Int) -> String? {
    
    return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    func pickerView(pickerView: UIPickerView,
                      numberOfRowsInComponent component: Int) -> Int {
        return self.rowsInt
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return self.numberOfComponents
    }

    
    func pickFruit() {
        for i in 0..<numberOfComponents {
            let randomNumer = arc4random_uniform(UInt32(rowsInt))
            self.fruitPicker.selectRow(Int(randomNumer), inComponent: i, animated: true)
        }
        
    }
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



