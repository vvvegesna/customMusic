//
//  MovieDetailHeaderViewCell.swift
//  customMusic
//
//  Created by Vegesna, Vijay V EX1 on 6/12/19.
//  Copyright © 2019 Vegesna, Vijay V EX1. All rights reserved.
//

import UIKit

protocol MovieDetailHeaderViewCellDelegate {
    func showButtonDidTaped(section: Int)
}

class MovieDetailHeaderViewCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    var delegate: MovieDetailHeaderViewCellDelegate?
    var selectedSection: Int = 0
   
    @IBAction func showLessTaped(_ sender: UIButton) {
        delegate?.showButtonDidTaped(section: selectedSection)
    }
}
