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
//    TodaysIssues(issues: [
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "삼성카드"),
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "현대차"),
//        TodaysIssue(title: "현대차")
//    ]),
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

        // 투명하지 않게 설정
//        self.navigationController?.navigationBar.isTranslucent = false // 왜 노치 양쪽 화면 사라지는지? (Safe Area)

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
        return issues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = issueTableView.dequeueReusableCell(withIdentifier: "issueArticleCell", for: indexPath) as! IssueArticleCell

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

        return cell

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
      }

    func registerCells() {
        issueTableView.register(IssueArticleCell.self, forCellReuseIdentifier: "issueArticleCell")

//        issueTableView.register(KeywordCell.self, forCellReuseIdentifier: "keywordCell")

        self.view.addSubview(issueTableView)
    }

}
