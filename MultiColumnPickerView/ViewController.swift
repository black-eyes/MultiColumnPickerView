//
//  ViewController.swift
//  MultiColumnPickerView
//
//  Created by ismail on 12/04/2020.
//  Copyright © 2020 ismail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //countries dictionnary
    var countries = [
        "morocco" : ["casa","rabat","Settat"],
        "france" : ["paris","Bordeaux","Nice"],
        "Uk" : ["london","bristol","liverpool"],
    ]
    var selectedrow = 0 //selected coutry : by default 0
    
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
         if component == 0 { //chekc if it's the countries column
             return countries.count
         }else{ // else its the cities column
             return Array(countries)[selectedrow].value.count
         }
         
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         if component == 0 { // fill the countries column with names
             return Array(countries.keys)[row]
         }else{ // fill the cities column
             return Array(countries)[selectedrow].value[row]
         }
         
     }
     //if picker row changed
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         if (component == 0) { // check if it's the coutries column
             selectedrow = row //store the selected coutry index
             picker.reloadAllComponents() // reload the picker (to refresh the cities column)
         }
     }


}

