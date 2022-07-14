//
//  NowPlayingCollectionViewCell.swift
//  cinefilando
//
//  Created by lrsv on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "nowPlayingCell"
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
}
