//
//  bottomDetailCell.swift
//  ExpandCell.EbueroApp
//
//  Created by PHENIXCRIME on 22/4/2564 BE.
//

import UIKit

class bottomDetailCell: UITableViewCell {
    @IBOutlet weak var txSubSetting: UILabel!
    
    static let identifier = "bottomDetailCell"
    
    static func nib() ->UINib {
        return UINib(nibName: "bottomDetailCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
