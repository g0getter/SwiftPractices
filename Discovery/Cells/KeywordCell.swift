//
//  KeywordCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/01.
//

import UIKit

class KeywordCell: UITableViewCell {

    static let identifier = "keywordCell"

    // Keyword image
    let keywordImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_discovery_keyword_01.png")
        return img
    }()

    // Keyword label
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initContent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func initContent() {
        contentView.addSubview(keywordImage)
        contentView.addSubview(keywordLabel)

        // TODO: 그림 크기 맞추기(ScaleToFit, etc)
        keywordImage.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(10)
            $0.left.equalTo(contentView).offset(25)
            $0.right.equalTo(keywordLabel.snp.left).offset(-20)
            $0.bottom.equalTo(contentView).offset(-10)
            $0.width.equalTo(78)
//            $0.height.equalTo(90) // 적용 안됨.
        }

        keywordLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(14)
//            $0.left.equalTo(keywordImage.snp.right).offset(20)
            $0.right.equalTo(contentView).offset(-45)
            $0.bottom.equalTo(contentView).offset(-14)
//            $0.width.equalTo(200) // 너비 대신 간격 지정
            $0.height.equalTo(50)
        }

        keywordLabel.numberOfLines = 2 // 라인 2개로 표시

    }

}
