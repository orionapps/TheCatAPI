//
//  CatViewModel.swift
//  TheCatAPI
//
//  Created by Aleksandrs Muravjovs on 21/05/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import Foundation

struct CatViewModel {
    
    let catImage: String
    
    // Dependency Injection
    
    init(catImage: CatModel) {
        self.catImage = catImage.url
    }
    
    func detailViewModel(for indexPath: IndexPath) -> DetailsViewModel {
        return DetailsViewModel(catImage: catImage)
    }

}


