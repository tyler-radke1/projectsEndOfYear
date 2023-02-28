//
//  SettingsTableViewCell.swift
//  Random User API
//
//  Created by Tyler Radke on 2/27/23.
//

import UIKit
protocol SettingsTableViewCellDelegate {
    func updateBool(forKey key: String)
}

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var settingLabel: UILabel!
    
    var delegate: SettingsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor).isActive = true
        // Initialization code
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        delegate?.updateBool(forKey: settingLabel.text ?? "gender")
    
    }
}
