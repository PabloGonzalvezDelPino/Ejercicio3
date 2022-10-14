//
//  DetailVC.swift
//  Ejercicio3
//
//  Created by Apps2T on 7/10/22.
//

import UIKit

class DetailVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var textTV: UITextView!
    @IBOutlet weak var villagePV: UIPickerView!
    
    var cellName: String = ""
    var cellUrl: String = ""
    var cellText: String = ""
    var cellVillage: String = ""
    
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

    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: cellUrl)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        
        nameLB.text = cellName
        detailImage.image = image
        textTV.text = cellText
        villagePV.selectRow(options.index(of:cellVillage) ?? 0, inComponent: 0, animated: true)
        villagePV.isUserInteractionEnabled = false
        }
        
    



}

