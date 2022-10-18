//
//  AddVC.swift
//  Ejercicio3
//
//  Created by Apps2T on 18/10/22.
//

import UIKit

class AddVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var villagePV: UIPickerView!
    
    let options: [String] = ["Hoja", "Arena", "Lluvia", "Niebla", "Roca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        villagePV.delegate = self
        villagePV.dataSource = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = self.options[row]
        return title
    }
    
    
    
    
    
    
    
    
    
}
