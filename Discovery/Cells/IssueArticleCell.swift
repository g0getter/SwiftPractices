//
//  IssueArticleCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/03.
//

 import UIKit

 class IssueArticleCell: UITableViewCell {

    static let identifier = "issueArticleCell"

//    let title: String = "월클 올라선 넥쏘, 글로벌 수소차 80% 장악"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "월클 올라선 넥쏘, 글로벌 수소차\n80% 장악"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "머니투데이 | 56분 전"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    let thumbnail: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "imgDiscoveryIssue01.png")
        return img
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(subLabel)
        contentView.addSubview(thumbnail)

        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(contentView).offset(4)
            $0.top.equalTo(contentView).offset(4+15) // 21: cell간 간격
            $0.left.equalTo(contentView).offset(25)
            $0.right.equalTo(contentView).offset(-113)
//            $0.bottom.equalTo(contentView).offset(-30)
        }

        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(58-48)
            $0.left.equalTo(contentView).offset(25)
            $0.bottom.equalTo(contentView).offset(-4-15) // 21: cell간 간격
            $0.height.equalTo(16)
        }

        thumbnail.snp.makeConstraints {
//            $0.top.equalTo(contentView).offset(0)
            $0.top.equalTo(contentView).offset(15)
            $0.right.equalTo(contentView).offset(-25)
//            $0.bottom.equalTo(contentView).offset(0)
            $0.bottom.equalTo(contentView).offset(-15) // 21: cell간 간격
            $0.width.height.equalTo(78)
        }

        titleLabel.numberOfLines = 2
    }
 }
