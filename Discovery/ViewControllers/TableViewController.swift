//
//  TableViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/18.
//

import UIKit

var items = ["책 구매", "약속", "스터디 준비"]

class TableViewController: UITableViewController {

    // Outlet 변수 추가
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row] // items를 대입.

        // Configure the cell...
        
        // TODO: Figure out how to customize cells
        shadowAndBorderForCell(yourTableViewCell: cell)
        return cell
    }
    
    func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
        // SHADOW AND BORDER FOR CELL
        //yourTableViewCell.contentView.layer.cornerRadius = 5
        yourTableViewCell.contentView.layer.borderWidth = 1.0
        yourTableViewCell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        yourTableViewCell.contentView.layer.masksToBounds = true
        yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
        yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        yourTableViewCell.layer.shadowRadius = 2.0
        yourTableViewCell.layer.shadowOpacity = 1.0
        yourTableViewCell.layer.masksToBounds = false
        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
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
