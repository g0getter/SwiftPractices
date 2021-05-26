//
//  DetailViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/26.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var verticalStackView: UIStackView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configureStackView()
        }
        
        private func configureStackView() {
            for _ in 0..<10 {
                let dummyView = randomColoredView()
                verticalStackView.addArrangedSubview(dummyView)
            }
        }
        
        // 랜덤 색상, 100~400 height를 가진 뷰 생성 함수
        private func randomColoredView() -> UIView {
            let view = UIView()
            view.backgroundColor = UIColor(
                displayP3Red: 1.0,
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: .random(in: 0...1))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: .random(in: 100...400)).isActive = true
            return view
        }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        // NavigationBar 숨김
//        self.navigationController?.isNavigationBarHidden = true
        
        // 경계 및 배경 삭제
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.clipsToBounds = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // TODO: 배경 이미지/색 다시 살리는 방법
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.clipsToBounds = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Scroll view 삽입
    

}
