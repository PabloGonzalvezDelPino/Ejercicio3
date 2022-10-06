//
//  Ninja.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//

import Foundation
class Ninja: ProtocolNinja{
    var imageUrl: String
    var name: String
    var village: String
    
    init(imageUrl:String, name:String, village:String){
        self.imageUrl = imageUrl
        self.name = name
        self.village = village
    }
    
    
    func getImageUrl() -> String {
        return imageUrl
    }
    
    func getName() -> String {
        return name
    }
    
    func getVillage() -> String {
        return village
    }
    
    func setImageUrl(giveURL: String) {
        imageUrl = giveURL
    }
    
    func setName(giveName: String) {
        name = giveName
    }
    
    func setVillage(giveVillage: String) {
        village = giveVillage
    }
    
 
}
