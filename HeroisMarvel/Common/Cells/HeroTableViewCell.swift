//
//  HeroTableViewCell.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    func prepareCell(with hero: Hero) {
        
        lbName.text = hero.name
        lbDescription.text = hero.description
        
        if let url = URL(string: hero.thumbnail.url) {
            
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        } else {
            
            ivThumb.image = nil
        }
        
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height/2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
    }
}
