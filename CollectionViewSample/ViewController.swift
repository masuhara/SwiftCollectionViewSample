//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Masuhara on 2019/06/08.
//  Copyright © 2019 Ylab Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pokemonCollectionView: UICollectionView!
    
    var pokemonArray = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setUpData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = pokemonCollectionView.indexPathsForSelectedItems![0]
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.pokemon = pokemonArray[selectedIndexPath.item]
    }
    
    func configureCollectionView() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        
        let nib = UINib(nibName: "PokemonCollectionViewCell", bundle: Bundle.main)
        pokemonCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    func setUpData() {
        let pokemon1 = Pokemon(name: "ピカチュウ", imageName: "pikachu.png")
        let pokemon2 = Pokemon(name: "ヒトカゲ", imageName: "hitokage.png")
        let pokemon3 = Pokemon(name: "フシギダネ", imageName: "fushigidane.png")
        let pokemon4 = Pokemon(name: "ゼニガメ", imageName: "zenigame.png")
        pokemonArray.append(pokemon1)
        pokemonArray.append(pokemon2)
        pokemonArray.append(pokemon3)
        pokemonArray.append(pokemon4)
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        let pokemon = pokemonArray[indexPath.row]
        
        cell.pokemonNamelabel.text = pokemon.name
        cell.pokemonImageView.image = UIImage(named: pokemon.imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width / 3) - 2
        let height: CGFloat = width * (4 / 3)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }

}
