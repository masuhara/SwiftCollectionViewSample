//
//  PokemonCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by Masuhara on 2019/06/08.
//  Copyright © 2019 Ylab Inc. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pokemonImageView: UIImageView!
    @IBOutlet var pokemonNamelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
