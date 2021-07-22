//
//  MarvelViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/10.
//

import UIKit
import Moya
import RxSwift

// TODO: RxSwift로 비동기 처리 필요
// ?1. 왜 self.view.backgroundColor를 지정해도 배경색이 안 바뀌는지
// ?2. 뭐가 문제인지. URL image 링크? X. URL image 출력 방식? 혹은 동기/비동기 처리 부족?

 class MarvelViewController: UIViewController {
    var marvelCollectionView: UICollectionView?

    let disposeBag = DisposeBag()

    var comics = [Comic]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendRequest()

        let view = UIView()
        view.backgroundColor = .white
//        self.view.backgroundColor = .white

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
               layout.itemSize = CGSize(width: 60, height: 60)

        marvelCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        self.view = view
        self.view.backgroundColor = .white
        self.registerCells()

//        self.decodingTest()

    }

    func sendRequest() {

        let provider = MoyaProvider<Marvel>()

        provider.rx.request(.comics)
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    self.parse(json: response.data)
                case .error(let error):
                    print(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)

    }

    func parse(json: Data) {
        if let jsonComics = try? JSONDecoder().decode(ResponseBody.self, from: json) {
            comics = jsonComics.data.results
            print(comics.last?.title ?? "")
            print(comics.last?.thumbnail.path ?? "")
        }
    }

    // ----------------------

    func decodingTest() {
        let jsonString = """
        {
        "data": {
            "first_name": "John",
            "last_name":  "Doe",
            "country":    "United Kingdom"
            }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let responseData = try! JSONDecoder().decode(ResponseBodyUser.self, from: jsonData)
        print(responseData.data.last_name)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    func registerCells() {
        // !!!!!!!ComicsCell.self를 등록해야 함
        marvelCollectionView?.register(ComicsCell.self, forCellWithReuseIdentifier: "comicsCell")
        marvelCollectionView?.dataSource = self
//        marvelCollectionView?.delegate = self
        self.view.addSubview(marvelCollectionView ?? UICollectionView())
    }

 }

 extension MarvelViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return comics.count
            return 3
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comicsCell", for: indexPath) as! ComicsCell

//            cell.backgroundColor = .blue

            // 새로운 코드(thumbnail)
//            guard let url = URL(string: comics[indexPath.row].thumbnail.path) else {
//                return UICollectionViewCell()
//            }
            guard let url = URL(string: "https://file.mk.co.kr/meet/neds/2020/02/image_readtop_2020_108886_15807067014073327.jpg") else {
                return UICollectionViewCell()
            }
            let data = try? Data(contentsOf: url)
            cell.comicsImage.image = UIImage(data: data ?? Data())

//            cell.comicsImage = comics[indexPath.row].thumbnail

            return cell
        }
 }
