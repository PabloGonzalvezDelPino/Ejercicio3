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
    let imagePredURL = "https://www.softzone.es/app/uploads-softzone.es/2018/04/guest.png"
    
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: imagePredURL)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        addImage.image = image
        }
        
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
