//
//  TableViewCell.swift
//  Test-Cenco
//
//  Created by Jose David Bustos H on 20-02-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var LblLanguage: UILabel!
    
    @IBOutlet weak var LblTitle: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
