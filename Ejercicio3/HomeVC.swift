//
//  HomeVC.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//
import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    let datosTabla = ["Yasuo", "Darius", "Garen", "Shaco", "Teemo"]
    //var ninjas = Array<Ninja>()
    let ninjas = [
        Ninja(imageUrl: "https://www.cinepremiere.com.mx/wp-content/uploads/2022/10/Naruto-20-aniversario-video-900x506.jpg", name: "Naruto", village: "Hoja"),
        Ninja(imageUrl: "https://i.ytimg.com/vi/OGkK7dBJsqw/maxresdefault.jpg", name: "Sasuke", village: "Hoja")
    ]
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosTabla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let proCell: MyCell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath) as! MyCell
        
        
        
        let name = ninjas[indexPath.row].getName()
        let village = ninjas[indexPath.row].getVillage()
        let url = URL(string: ninjas[indexPath.row].getImageUrl())
        let data = try? Data(contentsOf: url!)
        var imageView: UIImage = UIImage(data: data!)!
        
        proCell.nameLB.text = name
        proCell.villageLB.text = village
        proCell.ninjaIV.image = imageView
        return proCell
        
    }
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

