//
//  MovieDetailListViewController.swift
//  customMusic
//
//  Created by Vegesna, Vijay V EX1 on 6/12/19.
//  Copyright © 2019 Vegesna, Vijay V EX1. All rights reserved.
//

import UIKit

class SongsListViewCell: UITableViewCell {
    @IBOutlet weak var songsTitle: UILabel!
}

struct SongsCellData {
    var songTitle: String?
}

class MovieDetailListViewController: UITableViewController {

    var cellData = [SongsCellData]()
    var selectedMovie: CellData?
    var headerRowHeight: CGFloat = 250
    
    var expandedSection = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellData = [SongsCellData.init(songTitle: "Awesome Song"),
                    SongsCellData.init(songTitle: "Bhoom Bhoom Song"),
                    SongsCellData.init(songTitle: "Dhoom Song"),
                    SongsCellData.init(songTitle: "Darling Song")]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsListViewCell
        cell.songsTitle.text = cellData[indexPath.row].songTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerRowHeight
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Bundle.main.loadNibNamed("MovieDetailHeaderViewCell", owner: self, options: nil)?.first as! MovieDetailHeaderViewCell
        cell.delegate = self
        if let selectedMovie = selectedMovie {
            cell.detailImage.image = selectedMovie.image
            cell.detailTitle.text = selectedMovie.message
        }
        return cell
    }
}

extension MovieDetailListViewController: MovieDetailHeaderViewCellDelegate {
    func showButtonDidTaped() {
        print("Darling")
    }
}
