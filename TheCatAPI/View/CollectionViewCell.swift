//
//  CollectionViewCell.swift
//  TheCatAPI
//
//  Created by Aleksandrs Muravjovs on 22/05/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var catImageCell: UIImageView!
    
    var catViewModel: CatViewModel! {
        didSet {
            catImageCell.image = UIImage(named: catViewModel.catImage)
        }
    }
}
