//
//  UpcomingCollectionViewCell.swift
//  cinefilando
//
//  Created by lrsv on 18/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
}
