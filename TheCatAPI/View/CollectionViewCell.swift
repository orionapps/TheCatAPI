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


    @IBOutlet weak var imageViewCell: CustomImageView!
    
    var catViewModel: CatViewModel! {
        didSet {
            setUpCellImage()
        }
    }
    
    func setUpCellImage() {
        if let cellImageUrl = catViewModel?.catImage {

            imageViewCell.loadImageUsingUrlString(urlString: cellImageUrl)
        }
}
}
