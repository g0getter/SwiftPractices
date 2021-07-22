//
//  MarvelCollectionViewController.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/09.
//

import UIKit

private let reuseIdentifier = "Cell"

struct MarvelCharacter {
    let name: String
}

let characters: [MarvelCharacter] = [
    MarvelCharacter(name: "A"),
    MarvelCharacter(name: "B")
]

class MarvelCollectionViewController: UICollectionViewController {

    var marvelView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        marvelView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10

            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            return cv
        }()

        // Register cell classes
        self.marvelView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "marvelCell")
        self.view.addSubview(marvelView)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = marvelView.dequeueReusableCell(withReuseIdentifier: "marvelCell", for: indexPath) as! MarvelCell

        // Configure the cell

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
