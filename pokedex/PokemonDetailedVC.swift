//
//  PokemonDetailedVC.swift
//  pokedex
//
//  Created by Andriy Pryvalov on 12.09.16.
//  Copyright © 2016 Andriy Pryvalov. All rights reserved.
//

import UIKit

class PokemonDetailedVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var defenseLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var pokedexIdLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var baseAttackLbl: UILabel!
    
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = img
        currentEvoImg.image = img
        pokedexIdLbl.text = "\(pokemon.pokedexId)"

        pokemon.downloadPokemonDetails{
            
            self.UpdateUI()
        }
            
    
    
    }

    func UpdateUI(){
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        
        if pokemon.nextEvoId == ""{
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        
        }else{
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            let str = "Next Evolution: \(pokemon.nextEvoName) - LVL \(pokemon.nextEvoLvl)"
            evoLbl.text = str
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
   

}
