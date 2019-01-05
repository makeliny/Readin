//
//  Cell.swift
//  TushuDemo
//
//  Created by akke on 2018/12/26.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var bookimage: UIImageView!
    @IBOutlet weak var bookname: UILabel!
   
    @IBOutlet weak var bookauthor: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        bookname.adjustsFontSizeToFitWidth = true

        // Configure the view for the selected state
    }

}
