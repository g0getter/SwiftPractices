//
//  IssueKeywordCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/07.
//

import UIKit

/// Keyword cell 하나
///
/// e.g. *"현대차"*
class IssueKeywordCell: UICollectionViewCell {
    static let identifier = "issueKeywordCell"

    let keywordButton: UIButton = {
        let button = UIButton()
        button.setTitle("현대차", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        return button
    }()

}
