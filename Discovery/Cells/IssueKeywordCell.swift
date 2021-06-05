//
//  IssueKeywordTableViewCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/03.
//

import UIKit

class IssueKeywordCell: UITableViewCell {
    static let identifier = "issueKeywordCell"

    let keywordTitle: [String] = {
        return ["현대차", "삼성카드", "카카오", "SK하이닉스"]
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initContent() {
        // CollectionView 생성

//        contentView.addSubview(/*collectionView*/)
    }

}
