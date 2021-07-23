//
//  MarvelViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/10.
//

import UIKit
import Moya
import RxSwift

// CollectionView RxSwift 사용법 따로 있음 // 컬렉션뷰에 줄 데이터도 observable
// TODO: RxSwift로 비동기 처리 필요
// ?1. 왜 self.view.backgroundColor를 지정해도 배경색이 안 바뀌는지
// ?2. 뭐가 문제인지. URL image 링크? X. URL image 출력 방식? 혹은 동기/비동기 처리 부족?

// 기본 .subscribe, 컨트롤러에 drive 거는 것 써보기.   

 class MarvelViewController: UIViewController {
    var marvelCollectionView: UICollectionView?

    let disposeBag = DisposeBag()

    // TODO: 전역 변수로 만들지 않도록
    var comics = [Comic]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendRequest()

        // CollectionView - 3*3 만들기 -
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
               layout.itemSize = CGSize(width: 60, height: 60)

        marvelCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

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

    // TODO: try - catch(Json decode 실패 시 처리) + 발생하는 익셉션 종류별 처리(parsing 안되는 경우)
    // 알아보기: Moya - objectMap으로 .error 처럼 처리 가능
    func parse(json: Data) {
        if let jsonComics = try? JSONDecoder().decode(ResponseBody.self, from: json) {
            comics = jsonComics.data.results
            print("Title: \(comics.last?.title ?? "")")
            print("Thumbnail path: \(comics.last?.thumbnail.path ?? "")")
        }
    }

    func registerCells() {
        // !!!!!!!ComicsCell.self를 등록해야 함
        marvelCollectionView?.register(ComicsCell.self, forCellWithReuseIdentifier: "comicsCell")
        marvelCollectionView?.dataSource = self
        marvelCollectionView?.backgroundColor = .white
//        marvelCollectionView?.delegate = self
        self.view.addSubview(marvelCollectionView ?? UICollectionView())
    }
 }

 extension MarvelViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return comics.count
            return 3
        }

    // Image 처리: KingFisher - placeholder 사용
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let defaultURL: String = "https://file.mk.co.kr/meet/neds/2020/02/image_readtop_2020_108886_15807067014073327.jpg"
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comicsCell", for: indexPath) as? ComicsCell else {
                return UICollectionViewCell()
            }

            // 새로운 코드(thumbnail)
//            guard let url = URL(string: comics[indexPath.row].thumbnail.path) else {
//                return UICollectionViewCell()
//            }

            if !comics.isEmpty {
                if let url = URL(string: comics[indexPath.row].thumbnail.path) {
                    let data = try? Data(contentsOf: url)
                    cell.comicsImage.image = UIImage(data: data ?? Data())
                } else {
                    return UICollectionViewCell()
                }
            }

            return cell
        }
 }
