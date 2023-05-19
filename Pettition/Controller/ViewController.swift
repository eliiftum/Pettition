//
//  ViewController.swift
//  Pettition
//
//  Created by Elif Tum on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width

    @IBOutlet weak var collectionView: UICollectionView!
    
    var petition: PetitionMainModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getData()
  
    }

    func getData() {
        let url = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        NetworkManager.shared.getData(url: url) { (response:Result<PetitionMainModel, Error>) in
            switch response {
            case .success(let model):
                self.petition = model
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
        
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetitionCell", for: indexPath) as! PetitionCell
        cell.configure(petition: self.petition?.results[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.petition?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width-20, height: 250)
    }
}

