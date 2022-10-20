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
    var tVC: TableViewController!
    var table: UITableView!
    
    let options: [String] = ["Hoja", "Arena", "Lluvia", "Niebla", "Roca"]
    let imagePredURL = "https://www.softzone.es/app/uploads-softzone.es/2018/04/guest.png"
    var urlImage: String = ""
    var nameText: String = ""
    var descriptionText: String = ""
    var villageText: String = ""
    
    @IBAction func addImageBT(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        villageText = options[row]
    }
    @IBAction func addNinjaBT(_ sender: Any) {
        
        if (!(nameTF.text!.isEmpty ) && !(descriptionTF.text!.isEmpty) ){
            nameText = nameTF.text ?? ""
            descriptionText = descriptionTF.text ?? ""
            tVC.addToData(urlImage: "https://www.softzone.es/app/uploads-softzone.es/2018/04/guest.png" , nameNinja:nameText , villageNinja: villageText, descriptionNinja: descriptionText)
            table.reloadData()
            nameTF.text = ""
            descriptionTF.text = ""
            dismiss(animated: true)
            
            //performSegue(withIdentifier: "toTable", sender: nil)
        }
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

extension AddVC: UINavigationControllerDelegate & UIImagePickerControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        let key = UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)
        
        if let image = info[key] as? UIImage{
            self.addImage.image = image
            picker.dismiss(animated: true)
        }
    }
}
