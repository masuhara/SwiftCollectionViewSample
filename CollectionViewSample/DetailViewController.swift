//
//  DetailViewController.swift
//  CollectionViewSample
//
//  Created by Masuhara on 2019/06/08.
//  Copyright © 2019 Ylab Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pokemonNameLabel: UILabel!
    @IBOutlet var pokemonImageView: UIImageView!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemon.name
        pokemonImageView.image = UIImage(named: pokemon.imageName)
    }
    
    

}
