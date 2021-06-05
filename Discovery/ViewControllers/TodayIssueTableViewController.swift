//
//  TodayIssueTableViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/02.
//

import UIKit
// import SnapKit

protocol Base {}

struct TodaysIssues: Base {
    let issues: [TodaysIssue]
}

struct TodaysIssue {
    let title: String
}

struct IssueContent: Base {
    let title: String
    let image: String
}

let issues: [Base] = [
    TodaysIssues(issues: [
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "삼성카드"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차"),
        TodaysIssue(title: "현대차")
    ]),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png"),
    IssueContent(title: "title", image: "img_discovery_issue_01.png")
]

// var issues = ["월클 올라선 넥쏘,글로벌 수소차 80% 장악", "아이오닉5 초대박인데…반기지 못하는 사람들"]
// var issueImages = ["img_discovery_issue_01.png", "img_discovery_issue_02.png"]

class TodayIssueTableViewController: UITableViewController {

    // Q. 새로 선언하는 tableView와 기본 tableView의 차이?
    var issueTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none

        issueTableView = UITableView()
        self.registerCells()

        issueTableView.estimatedRowHeight = 50
        issueTableView.rowHeight = UITableView.automaticDimension

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "issueArticleCell", for: indexPath) as! IssueArticleCell
        // issues 형식 따라 경우 나눠서 casting
        // TODO: Casting 방식. 강제 캐스팅?
//        if issues[(indexPath as NSIndexPath).row] is TodaysIssue {
////            let cell = tableView.dequeueReusableCell(withIdentifier: "issueKeywordCell", for: indexPath) as! IssueKeywordCell
//            cell = tableView.dequeueReusableCell(withIdentifier: "issueArticleCell", for: indexPath) as! IssueArticleCell
//
//
//            return cell
//
//        } else if issues[(indexPath as NSIndexPath).row] is IssueContent {
//            cell = tableView.dequeueReusableCell(withIdentifier: "issueArticleCell", for: indexPath) as! IssueArticleCell
//            return cell
//        }

//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell

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

    func registerCells() {
        // TODO: 가능한지 확인.
//        issueTableView.register(IssueKeywordCell.self, forCellReuseIdentifier: "issueKeywordCell")
        issueTableView.register(IssueArticleCell.self, forCellReuseIdentifier: "issueArticleCell")

        self.view.addSubview(issueTableView)
    }
}
