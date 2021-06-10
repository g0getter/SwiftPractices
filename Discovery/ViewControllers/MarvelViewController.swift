//
//  MarvelViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/10.
//

import UIKit
import Moya
import RxSwift

class MarvelViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendRequest()
        // Do any additional setup after loading the view.
    }

    func sendRequest() {

        let provider = MoyaProvider<Marvel>()

        provider.rx.request(.comics)
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    print(response)
                case .error(let error):
                    print(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)

    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
