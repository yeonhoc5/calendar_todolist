//
//  TableViewCell.swift
//  220725_TodoList
//
//  Created by YHChoi on 2022/07/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
