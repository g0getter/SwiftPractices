//
//  DetailViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var discoveryCard: UIImageView!

    @IBOutlet weak var pageTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

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
