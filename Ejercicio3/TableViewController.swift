//
//  TableViewController.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//

import UIKit

class TableViewController: UITableViewController {

    let ninjas = [
        ("Hoja",Ninja(imageUrl: "https://www.cinepremiere.com.mx/wp-content/uploads/2022/10/Naruto-20-aniversario-video-900x506.jpg", name: "Naruto", village: "Hoja", description: "El ninja mas golfo de la historia de los ninjas"),
         Ninja(imageUrl: "https://i.ytimg.com/vi/OGkK7dBJsqw/maxresdefault.jpg", name: "Sasuke", village: "Hoja",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"),
         Ninja(imageUrl: "https://static.wikia.nocookie.net/naruto/images/c/c8/Itachi_Uchiha_Parte_I_y_II_Anime.png/revision/latest?cb=20170113110759&path-prefix=es", name: "Itachi", village: "Hoja",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"))
        ,
        ("Arena",Ninja(imageUrl: "https://i.pinimg.com/originals/2e/f7/96/2ef7960089f0a28024d2486c291c8c9d.jpg", name: "Gaara", village: "Arena",description: "El kage de la arena el mas gradne de todos lo ninjas de esta aldea. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."))
        ,
        ("Lluvia",Ninja(imageUrl: "https://i.pinimg.com/736x/61/c5/f2/61c5f2aa1220ab5055cfeb460457e576.jpg", name: "Nagato", village: "Lluvia",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"))
        ,
        ("Niebla",Ninja(imageUrl: "https://static.wikia.nocookie.net/narutoinuyashapokemnyharrypotter/images/1/12/Zabuza_Momochi.jpg/revision/latest?cb=20130611195409&path-prefix=es", name: "Zabuza", village: "Niebla",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"))
        ,
        ("Roca",Ninja(imageUrl: "https://static.wikia.nocookie.net/naruto/images/8/86/Deidara_con_su_Ojo_Telesc%C3%B3pico.png/revision/latest?cb=20160417144808&path-prefix=es", name: "Deidara", village: "Roca",description: "Un ninja originario de la aldea oculta de la hoja pero que traicionó a la aldea y vive desterrado"))
    ]
    /*ENlaces bacanos
     https://guides.codepath.com/ios/Table-View-Guide
     https://stackoverflow.com/questions/58853099/how-to-arrange-items-into-sections-in-a-tableview
     
     */ as [Any]
    let options: [String] = ["Hoja", "Arena", "Lluvia", "Niebla", "Roca"]
    
    
    var nameSelected: String = ""
    var urlImageSelected: String = ""
    var villageSelected: String = ""
    var descriptionSelected: String = ""
    
    let cellIdentifier = "TableViewCell", headerViewIdentifier = "TableViewHeaderView"
    
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ninja = ninjas[section]
        return groupedItems[ninja].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return options[section]
        }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameSelected = ninjas[indexPath.row].getName()
        urlImageSelected = ninjas[indexPath.row].getImageUrl()
        descriptionSelected = ninjas[indexPath.row].getDescription()
        villageSelected = ninjas[indexPath.row].getVillage()
        
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! DetailVC).cellUrl = urlImageSelected
        (segue.destination as! DetailVC).cellName = nameSelected
        (segue.destination as! DetailVC).cellText = descriptionSelected
        (segue.destination as! DetailVC).cellVillage = villageSelected
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerViewIdentifier)
        // Do any additional setup after loading the view.
    }
}
