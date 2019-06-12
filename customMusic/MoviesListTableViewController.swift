//
//  MoviesListTableViewController.swift
//  customMusic
//
//  Created by Vegesna, Vijay V EX1 on 6/8/19.
//  Copyright © 2019 Vegesna, Vijay V EX1. All rights reserved.
//

import UIKit

class MovieListCustomCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
}

struct CellData {
    var image: UIImage?
    var message: String?
}

class MoviesListTableViewController: UITableViewController {

    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [CellData.init(image: #imageLiteral(resourceName: "movieIcon"), message: "first movie"),
                CellData.init(image: #imageLiteral(resourceName: "movieIcon"), message: "second movie"),
                CellData.init(image: #imageLiteral(resourceName: "movieIcon"), message: "third movie")]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListCustomCell
        cell.icon.image = data[indexPath.row].image
        cell.name.text = data[indexPath.row].message
        return cell
    }
}
