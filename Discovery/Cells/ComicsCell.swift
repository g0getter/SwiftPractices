//
//  ComicsCell.swift
//  Discovery
//
//  Created by Aiden on 2021/07/22.
//

import Foundation
import UIKit

class ComicsCell: UICollectionViewCell {
    var comicsImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_discovery_keyword_01.png")
        return img
    }()

}
