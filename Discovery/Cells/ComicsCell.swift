//
//  ComicsCell.swift
//  Discovery
//
//  Created by Aiden on 2021/07/22.
//

import Foundation
import UIKit

class ComicsCell: UICollectionViewCell {

    static let identifier = "comicsCell"

    var comicsImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_discovery_keyword_01.png")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initContent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func initContent() {
        contentView.addSubview(comicsImage)

        comicsImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.left.equalToSuperview()
        }
    }

}
