//
//  PokedexViewController.swift
//  PokemonGo
//
//  Created by Arian Angoma on 5/19/19.
//  Copyright © 2019 Arian Angoma. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemonsAtrapados:[Pokemon] = []
    var pokemonsNoAtrapados:[Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonsAtrapados = obtenerPokemonsAtrapados()
        pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Atrapados"
        } else {
            return "No atrapados"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return pokemonsAtrapados.count
        } else {
            return pokemonsNoAtrapados.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon : Pokemon
        
        if indexPath.section == 0 {
            pokemon = pokemonsAtrapados[indexPath.row]
        } else {
            pokemon = pokemonsNoAtrapados[indexPath.row]
        }
        
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.nombre
        cell.imageView?.image = UIImage(named: pokemon.imagenNombre!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let pokemons = pokemonsAtrapados[indexPath.row]
        
        if editingStyle == .delete {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(pokemons)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            pokemonsAtrapados = obtenerPokemonsAtrapados()
            tableView.reloadData()
            
        }
    }
}
