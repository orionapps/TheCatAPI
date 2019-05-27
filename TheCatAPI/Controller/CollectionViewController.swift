//
//  CollectionViewController.swift
//  TheCatAPI
//
//  Created by Aleksandrs Muravjovs on 21/05/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "catCell"

class CollectionViewController: UICollectionViewController  {
    
    
    var catViewModel = [CatViewModel]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    //MARK: - Fetching data
    
    fileprivate func fetchData() {

            do {
                try Service.shared.getData(completion: { (catArr) in
                    DispatchQueue.main.async {

                        self.catViewModel.removeAll()
                        self.catViewModel = catArr.map({return CatViewModel(catImage: $0)})
                        self.collectionView.reloadData()
                    }
                })
            } catch let error {
                print("error in getData - \(error)")
            }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       testInternetConnection()
    }
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return catViewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.catViewModel = catViewModel[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "goToDetails" , sender: indexPath.item)
        
        //self.navigationController?.pushViewController(destVC, animated: true)
    }


    //MARK: - Requesting a new data in case of internet connection loss
    
    @IBAction func refreshButton(_ sender: Any) {

        fetchData()
    }
    
    //MARK: - Internet availability test
    
    func testInternetConnection() {
        
        if Reachability.isConnectedToNetwork() == true
        {
            print("Connected")
        }
        else
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            controller.addAction(ok)
            controller.addAction(cancel)
            
            present(controller, animated: true, completion: nil)
        }
    }
}
