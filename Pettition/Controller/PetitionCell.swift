//
//  PetitionCell.swift
//  Pettition
//
//  Created by Elif Tum on 18.05.2023.
//

import UIKit

class PetitionCell: UICollectionViewCell {
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure (petition:PetitionModel?){
        bodyLabel.text = petition?.body ?? ""
        titleLabel.text = petition?.title ?? ""
    }
}
