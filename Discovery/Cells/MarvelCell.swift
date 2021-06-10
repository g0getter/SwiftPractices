//
//  MarvelCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/09.
//

// TODO:
// 1. CollectionViewCell 가장 간단한 사용법
// string 하드 코딩해서 horizontal collection view 출력해보기
// 2-1. Moya 사용법
// 2-2. RxSwift 사용
// 3. Marvel API 연결
// - documentation 참고
// 4.
import UIKit

class MarvelCell: UICollectionViewCell {

    static let identifier = "marvelCell"

    let character: UILabel = {
       let label = UILabel()
        label.text = "Character1"
        return label
    }()

    // Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func initLabel() {
        contentView.addSubview(character)

        character.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.edges.leftMargin.rightMargin.equalToSuperview().offset(10) // 맞는지? TODO: edge, insets 사용법
            $0.bottom.equalToSuperview().offset(-10)

        }
    }
}
