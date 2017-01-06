//
//  BaseCell.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 06/01/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    func setupViews() {}
    
}
