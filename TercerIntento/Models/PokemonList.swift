//
//  PokemonList.swift
//  TercerIntento
//
//  Created by Marco Alba on 8/29/23.
//

import Foundation

struct PokemonList: Decodable {
    let count : Int
    let next : String?
    let previous : String?
    let results : [Pokemon]
}
