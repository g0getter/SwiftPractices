//
//  CustomCell.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/20.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var discoveryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    // 재사용 준비
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 화면 변하기 전 모습 보여주지 않기 위해 미리 초기화 필요
        self.switchButton.isOn = true
        
    }
}
