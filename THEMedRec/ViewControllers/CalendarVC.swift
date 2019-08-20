//
//  CalendarVC.swift
//  THEMedRec
//
//  Created by Williams, Kai on 8/20/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var occupation = ["Physician", "Patient"]
    var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        setupPicker()
        
        view.addSubview(picker)
        
    }
    
    func setupPicker() {
        //register button x, y, width, height constraints
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        picker.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        <#code#>
    }
}
