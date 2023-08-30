//
//  FirstViewController.swift
//  TercerIntento
//
//  Created by Marco Alba on 8/28/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            FirstTableViewCell.self,
            forCellReuseIdentifier: FirstTableViewCell.identifier
        )
        return tableView
    } ()
    private var pokemonManager: PokemonManager?
    private var pokemonList: [Pokemon]? {
        didSet {
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
        downloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .link
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
    }
    
    func downloadData() {
        pokemonManager = PokemonManager()
        pokemonManager?.fetchPokemonList{ pokemonListResponse in
            DispatchQueue.main.async { [self] in
                navigationItem.title = "\(pokemonListResponse.count)"
            }
            self.pokemonList = pokemonListResponse.results
        }
    }
    
    
    
}

extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier) as! FirstTableViewCell
        cell.setImageAndLabel(pokemonManager: pokemonManager!, pokemonUrl: pokemonList?[indexPath.row].url ?? "Nada :(", labelText: pokemonList?[indexPath.row].name ?? "Nada :(")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

#Preview() {
    FirstViewController()
}
