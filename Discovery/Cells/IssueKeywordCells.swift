//
//  IssueKeywordCells.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/06.
//

import UIKit

class IssueKeywordCells: UITableViewCell {
    static let identifier = "issueKeywordCells"

//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "월클 올라선 넥쏘, 글로벌 수소차\n80% 장악"
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        return label
//    }()

    let keywordButton: UIButton = {
        let button = UIButton()
        button.setTitle("현대차", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        return button
    }()

    // CollectionView 생성
    let todaysIssues: TodaysIssues = TodaysIssues(issues: [
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "삼성카드"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차")
    ])

    let issuesCollectionView: UICollectionView = {
        let keywordButton: UIButton = {
            let button = UIButton()
            button.setTitle("현대차", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            return button
        }()

        let view = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(keywordButton)

        return view
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
        contentView.addSubview(issuesCollectionView)

//        keywordButton.snp.makeConstraints {
//            $0.top.equalTo(contentView).offset(0)
//            $0.left.equalTo(contentView).offset(13)
//            $0.right.equalTo(contentView).offset(-113)
//            $0.bottom.equalTo(contentView).offset(-30)

//        }

    }
}
