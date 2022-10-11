//
//  TableViewController.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//

import UIKit

class TableViewController: UITableViewController {

    let ninjas = [
        Ninja(imageUrl: "https://www.cinepremiere.com.mx/wp-content/uploads/2022/10/Naruto-20-aniversario-video-900x506.jpg", name: "Naruto", village: "Hoja", description: "El ninja mas golfo de la historia de los ninjas"),
        Ninja(imageUrl: "https://i.ytimg.com/vi/OGkK7dBJsqw/maxresdefault.jpg", name: "Sasuke", village: "Hoja",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"),
        Ninja(imageUrl: "https://static.wikia.nocookie.net/naruto/images/c/c8/Itachi_Uchiha_Parte_I_y_II_Anime.png/revision/latest?cb=20170113110759&path-prefix=es", name: "Itachi", village: "Hoja",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado")
    ]
    
    var nameSelected: String = ""
    var urlImageSelected: String = ""
    var villageSelected: String = ""
    var descriptionSelected: String = ""
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameSelected = ninjas[indexPath.row].getName()
        urlImageSelected = ninjas[indexPath.row].getImageUrl()
        descriptionSelected = ninjas[indexPath.row].getDescription()
        
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! DetailVC).cellUrl = urlImageSelected
        (segue.destination as! DetailVC).cellName = nameSelected
        (segue.destination as! DetailVC).cellText = descriptionSelected
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
