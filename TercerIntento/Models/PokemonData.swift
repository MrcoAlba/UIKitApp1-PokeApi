//
//  PokemonData.swift
//  TercerIntento
//
//  Created by Marco Alba on 8/29/23.
//

import Foundation

struct PokemonData: Decodable {
    let base_experience : Int?
    let height : Int?
    let id : Int?
    let name : String?
    let order : Int?
    let sprites : Sprite?
}

struct Sprite: Decodable {
    let front_default : String?
}
