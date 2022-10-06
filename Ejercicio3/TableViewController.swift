//
//  TableViewController.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//

import UIKit

class TableViewController: UITableViewController {

    let ninjas = [
        Ninja(imageUrl: "https://www.cinepremiere.com.mx/wp-content/uploads/2022/10/Naruto-20-aniversario-video-900x506.jpg", name: "Naruto", village: "De la Hoja"),
        Ninja(imageUrl: "https://i.ytimg.com/vi/OGkK7dBJsqw/maxresdefault.jpg", name: "Sasuke", village: "De la Hoja"),
        Ninja(imageUrl: "https://static.wikia.nocookie.net/naruto/images/c/c8/Itachi_Uchiha_Parte_I_y_II_Anime.png/revision/latest?cb=20170113110759&path-prefix=es", name: "Itachi", village: "De la Hoja"),
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ninjas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let proCell: MyCell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath) as! MyCell
        
        let name = ninjas[indexPath.row].getName()
        let village = ninjas[indexPath.row].getVillage()
        let url = URL(string: ninjas[indexPath.row].getImageUrl())
        let data = try? Data(contentsOf: url!)
        let imageView: UIImage = UIImage(data: data!)!
        
        proCell.nameLB.text = name
        proCell.villageLB.text = village
        proCell.ninjaIV.image = imageView
        return proCell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
