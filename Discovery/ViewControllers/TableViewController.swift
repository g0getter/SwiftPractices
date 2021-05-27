//
//  TableViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/18.
//

import UIKit

var items = ["똑똑한 투자 방법에는 \n무엇이 있을까?", "자산배분 어떻게 하는게\nBest 일까", "자녀에게 주식 증여하여\n투자하는 법", "똑똑한 투자 방법에는 \n무엇이 있을까?", "자산배분 어떻게 하는게\nBest 일까", "자녀에게 주식 증여하여\n투자하는 법", "똑똑한 투자 방법에는 \n무엇이 있을까?", "자산배분 어떻게 하는게\nBest 일까", "자녀에게 주식 증여하여\n투자하는 법", "똑똑한 투자 방법에는 \n무엇이 있을까?", "자산배분 어떻게 하는게\nBest 일까", "자녀에게 주식 증여하여\n투자하는 법"]
var details = ["주린이를 위한 실전 꿀팁", "2021 전망 글로벌\n자산 배분 5대 키워드", "미성년 자녀에게\n똑똑하게 주식 증여하기", "주린이를 위한 실전 꿀팁", "2021 전망 글로벌\n자산 배분 5대 키워드", "미성년 자녀에게\n똑똑하게 주식 증여하기", "주린이를 위한 실전 꿀팁", "2021 전망 글로벌\n자산 배분 5대 키워드", "미성년 자녀에게\n똑똑하게 주식 증여하기", "주린이를 위한 실전 꿀팁", "2021 전망 글로벌\n자산 배분 5대 키워드", "미성년 자녀에게\n똑똑하게 주식 증여하기"]
var images = ["iosDiscoveryCardSmall01.png", "iosDiscoveryCardSmall02.png", "iosDiscoveryCardSmall03.png", "iosDiscoveryCardSmall01.png", "iosDiscoveryCardSmall02.png", "iosDiscoveryCardSmall03.png", "iosDiscoveryCardSmall01.png", "iosDiscoveryCardSmall02.png", "iosDiscoveryCardSmall03.png", "iosDiscoveryCardSmall01.png", "iosDiscoveryCardSmall02.png", "iosDiscoveryCardSmall03.png"]

class TableViewController: UITableViewController {

    // Outlet 변수 추가
    @IBOutlet var tvListView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Section에 들어갈 데이터 row(cell)의 개수 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // 구체적인 하나의 row(cell) 반환. cell 안에 데이터 넣음.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // CustomCell로 캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell

        cell.titleLabel?.text =  items[(indexPath as NSIndexPath).row]
        cell.detailsLabel?.text = details[(indexPath as NSIndexPath).row]
        cell.discoveryImage?.image = UIImage(named: images[(indexPath as NSIndexPath).row])

//        guard let vc =  storyboard?.instantiateViewController(identifier: "detailViewController") as? DetailViewController else
//        { return }

//        vc.pageTitle = cell.titleLabel

        if indexPath.row == 0 {
            cell.switchButton?.isOn = false
        } else {
//            cell.switchButton?.isOn = true // prepareForReuse()하면 필요 없음.
        }

        //        // decelerationRate - 속도 조절 .normal OR .fast
        //        tableView.decelerationRate = .init(rawValue: 0.8)
        //        print(tableView.decelerationRate.rawValue)

        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        return cell
    }
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
