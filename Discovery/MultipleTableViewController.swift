//
//  MultipleTableViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/05/24.
//

import UIKit

class MultipleTableViewController: UITableViewController {
    
    //    let types = ["A", "B", "B", "A"]
    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        tableView.separatorStyle = .none
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(keywordImages.count + images.count)
        return keywordImages.count + images.count
    }
    
    // delegate 함수 --> 추후 RxSwift 쓰면 간단하게 해결 가능.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        //        if(types[(indexPath as NSIndexPath).row] == "A") {
        if(((indexPath as NSIndexPath).row) % 2 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "keywordsCell", for: indexPath) as! KeywordsTableViewCell
//            let indexK = ((indexPath as NSIndexPath).row) / 2
            cell.keywordImage?.image = UIImage(named: keywordImages[1])
            cell.keywordImageLabel?.image = UIImage(named: keywordImageLabels[1])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            let index = ((indexPath as NSIndexPath).row - 1 ) / 2
            cell.titleLabel?.text =  items[index]
            cell.detailsLabel?.text = details[index]
            cell.discoveryImage?.image = UIImage(named: images[index])
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
    
}
