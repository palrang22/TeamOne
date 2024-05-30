//
//  TeamOneCollectionViewCell.swift
//  TeamOne
//
//  Created by 임혜정 on 5/27/24.
//

import UIKit

class TeamOneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
    }
    
    func configure(_ teamOne: TeamOneList){
        nameLabel.text = teamOne.name
        thumbnail.image = UIImage(named: teamOne.profileImage)
        thumbnail.layer.cornerRadius = thumbnail.frame.size.width / 2.0
        comment.text = teamOne.comment

        
    }
    private func setupCellAppearance() {
        
        
        self.contentView.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        let hexColor = "#F2F2F2"
        self.layer.borderColor = UIColor(hex: hexColor).cgColor
        self.contentView.layer.masksToBounds = true
        
        // 그림자 설정
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        
        updateShadowPath()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath()
    }
    
    private func updateShadowPath() {
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius)
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    
}
