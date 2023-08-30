//
//  PokemonController.swift
//  TercerIntento
//
//  Created by Marco Alba on 8/29/23.
//

import UIKit

struct PokemonManager {
    
    func fetchPokemonList (completion: @escaping(PokemonList) -> Void) {
        print("SE BUSCÓ LA DATA :) fetchPokemonList")
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1000")
        else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let error = err {
                print("Error is: \(error.localizedDescription)")
            }
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PokemonList.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
    
    func fetchPokemonByUrl (pokemonUrl: String, completion: @escaping(PokemonData) -> Void) {
        print("SE BUSCÓ LA DATA :) fetchPokemonByUrl: \(pokemonUrl)")
        guard let url = URL(string: pokemonUrl)
        else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let error = err {
                print("Error is: \(error.localizedDescription)")
            }
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PokemonData.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
}

