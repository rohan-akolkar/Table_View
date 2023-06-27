//
//  StudentTableViewCell.swift
//  Table_View
//
//  Created by Mac on 27/06/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var studentLastNameLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studetImageView: UIImageView!
    @IBOutlet weak var studentMobileNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
