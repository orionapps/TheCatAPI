//
//  DetailViewController.swift
//  TheCatAPI
//
//  Created by Aleksandrs Muravjovs on 23/05/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var largeImageView: UIImageView!
    
    var detailViewModel = [DetailsViewModel]()
    var detailImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.largeImageView.image = detailImage
    
    }

}
