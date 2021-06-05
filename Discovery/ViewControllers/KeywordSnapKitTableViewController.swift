//
//  KeywordSnapKitTableViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/31.
//

import UIKit
import SnapKit

struct Label {
    let title: String
}

var keywordLabels: [Label] = [Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF"), Label(title: "투알못 탈출하기\nELS?, 이엘에스?, 엘스?"), Label(title: "재테크의 시작\n주식과 펀드의 차이"), Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF"), Label(title: "투알못 탈출하기\nELS?, 이엘에스?, 엘스?"), Label(title: "재테크의 시작\n주식과 펀드의 차이"), Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF"), Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF"), Label(title: "투알못 탈출하기\nELS?, 이엘에스?, 엘스?"), Label(title: "재테크의 시작\n주식과 펀드의 차이"), Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF"), Label(title: "투알못 탈출하기\nELS?, 이엘에스?, 엘스?"), Label(title: "재테크의 시작\n주식과 펀드의 차이"), Label(title: "다양한 자산, 간단한 매매,\n가성비의 대표 ETF")]

var keywordImage = ["imgDiscoveryKeyword01.png", "imgDiscoveryKeyword02.png", "imgDiscoveryKeyword03.png", "imgDiscoveryKeyword04.png", "imgDiscoveryKeyword05.png", "imgDiscoveryKeyword06.png", "imgDiscoveryKeyword07.png", "imgDiscoveryKeyword01.png", "imgDiscoveryKeyword02.png", "imgDiscoveryKeyword03.png", "imgDiscoveryKeyword04.png", "imgDiscoveryKeyword05.png", "imgDiscoveryKeyword06.png", "imgDiscoveryKeyword07.png"]

class KeywordSnapKitTableViewController: UITableViewController {

    var keywordTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.navigationController?.navigationBar.isTranslucent = false // 왜 노치 양쪽 화면 사라지는지? (Safe Area)
        keywordTableView = UITableView()
        keywordTableView.backgroundColor = .blue
        self.createUI()
        self.setConstraints()

        keywordTableView.estimatedRowHeight = 50
        keywordTableView.rowHeight = UITableView.automaticDimension

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.tintColor = .black

    }

    override func viewWillDisappear(_ animated: Bool) {
        // TODO: 배경 이미지/색 다시 살리는 방법
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        // 경계 살리기
        self.navigationController?.navigationBar.clipsToBounds = false
        self.navigationController?.navigationBar.tintColor = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return keywordLabels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = keywordTableView.dequeueReusableCell(withIdentifier: KeywordCell.identifier, for: indexPath) as! KeywordCell

        cell.keywordImage.image = UIImage(named: keywordImage[(indexPath as NSIndexPath).row])
        cell.keywordLabel.text = keywordLabels[(indexPath as NSIndexPath).row].title
        //        cell.snp.makeConstraints({
        //            $0.left.equalToSuperview().offset(25)
        //            $0.right.equalToSuperview().offset(37)
        //            $0.right.equalTo(self.keywordTableView).offset(10)
        //            $0.left.equalTo(keywordTableView.snp.top).offset(50)
        //        })
        //        cell.backgroundColor = .yellow

        return cell
    }

    func createUI() {
        self.title = "추천 키워드"
        //        keywordTableView.delegate = self
        //        keywordTableView.dataSource = self
        keywordTableView.register(KeywordCell.self, forCellReuseIdentifier: "keywordCell")
        // TODO: Title 높이 변경

    }

    func setConstraints() {
        self.view.addSubview(keywordTableView)
        //        NSLayoutConstraint.activate([
        //            keywordTableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        //        ])
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
