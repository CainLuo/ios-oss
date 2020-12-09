//
//  MyItemCell.swift
//  OAMyKit
//
//  Created by YYKJ0048 on 2020/12/9.
//

import UIKit

class MyItemCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var item: MyItemModel! {
        didSet {
            titleLabel.text = item.title
            iconImageView.image = item.icon
        }
    }
}
