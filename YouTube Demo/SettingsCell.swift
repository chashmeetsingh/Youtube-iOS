//
//  SettingsCell.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 08/01/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : .white
            nameLabel.textColor = isHighlighted ? .white : .darkGray
            imageIcon.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.imageName {
                imageIcon.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                imageIcon.tintColor = .darkGray
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let imageIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_settings")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
       
        addSubview(nameLabel)
        addSubview(imageIcon)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", view: imageIcon, nameLabel)
        addConstraintsWithFormat(format: "V:[v0(30)]", view: imageIcon)
        addConstraint(NSLayoutConstraint(item: imageIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format: "V:|[v0]|", view: nameLabel)
    }
    
}
