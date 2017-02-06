//
//  MedicineListTableViewCell.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class MedicineListTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func configureCell(showItem:MedicinesList.MedicineShowItem) {
    nameLabel.text = showItem.name
  }
}
