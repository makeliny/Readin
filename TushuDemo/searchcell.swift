//
//  searchcell.swift
//  TushuDemo
//
//  Created by akke on 2019/1/2.
//  Copyright © 2019 akke. All rights reserved.
//

import UIKit

class searchcell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var fm: UIImageView!
    @IBOutlet weak var bkauthor: UILabel!
    
    @IBOutlet weak var bktitle: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
