//
//  DetailVC.swift
//  Ejercicio3
//
//  Created by Apps2T on 7/10/22.
//

import UIKit

class DetailVC: UIViewController {
    
    var cellName: String = ""
    var cellUrl: String = ""

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var nameLB: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: cellUrl)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        
        nameLB.text = cellName
        detailImage.image = image
    }



}

