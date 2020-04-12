//
//  ViewController.swift
//  MultiColumnPickerView
//
//  Created by ismail on 12/04/2020.
//  Copyright © 2020 ismail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var countries = [
        "morocco" : ["casa","rabat","Settat"],
        "france" : ["paris","Bordeaux","Nice"],
        "Uk" : ["london","bristol","liverpool"],
    ]
    var selectedrow = 0
    
    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
    }
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 2
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         if component == 0 {
             return countries.count
         }else{
             return Array(countries)[selectedrow].value.count
         }
         
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         if component == 0 {
             return Array(countries.keys)[row]
         }else{
             return Array(countries)[selectedrow].value[row]
         }
         
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         if (component == 0) {
             selectedrow = row
             picker.reloadAllComponents()
         }
     }


}

