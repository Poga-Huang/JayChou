//
//  SliderCell.swift
//  JayChouMusicApp
//
//  Created by 黃柏嘉 on 2022/9/3.
//

import UIKit

class SliderCell: UICollectionViewCell {

    @IBOutlet weak var contentImage: SliderImage!
    
    func configureCell(_ imageName:String){
        contentImage.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
