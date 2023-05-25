//
//  MyTableViewCell.swift
//  AccordionView
//
//  Created by Ideas2IT on 24/05/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var selectedOptLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var iconImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectedOptLbl.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
