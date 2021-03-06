//
//  PopularCollectionViewCell.swift
//  cinefilando
//
//  Created by lrsv on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "PopularCollectionViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func setup(title: String, image: UIImage) {
        titleLabel.text = title
        self.image.image = image
    }
}
