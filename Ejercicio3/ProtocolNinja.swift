//
//  ProtocolNinja.swift
//  Ejercicio3
//
//  Created by Apps2T on 6/10/22.
//


protocol ProtocolNinja {
    var imageUrl: String { get set}
    var name: String { get set}
    var village: String { get set}
    
    // Getters
    func getImageUrl() -> String
    func getName() -> String
    func getVillage() -> String
    
    // Setters
    func setImageUrl(giveURL: String)
    func setName(giveName: String)
    func setVillage(giveVillage: String)
}
