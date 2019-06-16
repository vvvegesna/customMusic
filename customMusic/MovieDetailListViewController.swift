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
        var rows = 0
        if expandedSection.contains(section) {
            rows = cellData.count
        }
        return rows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsListViewCell
        cell.songsTitle.text = cellData[indexPath.row].songTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerRowHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Bundle.main.loadNibNamed("MovieDetailHeaderViewCell", owner: self, options: nil)?.first as! MovieDetailHeaderViewCell
        cell.delegate = self
        cell.selectedSection = section
        cell.detailImage.image = selectedMovie?.image
        cell.detailTitle.text = selectedMovie?.message
        if expandedSection.contains(section) {
            cell.showButton.setTitle("Show Less", for: .normal)
        } else {
            cell.showButton.setTitle("Show More", for: .normal)
        }
        return cell
    }
}

extension MovieDetailListViewController: MovieDetailHeaderViewCellDelegate {
    func showButtonDidTaped(section: Int) {
        if expandedSection.contains(section) {
            expandedSection = expandedSection.filter{ $0 != section }
        } else {
            expandedSection.append(section)
        }
        tableView.reloadData()
    }
}
