//
//  SliderImage.swift
//  JayChouMusicApp
//
//  Created by 黃柏嘉 on 2022/9/3.
//

import UIKit

class SliderImage: UIImageView {

    override func layoutSubviews() {
        if layer.sublayers == nil{
            let imageGradientLayer = CAGradientLayer()
            imageGradientLayer.frame = self.bounds
            imageGradientLayer.colors = [UIColor.clear.cgColor,UIColor.themeBlack.cgColor]
            imageGradientLayer.locations = [0,0.9]
            layer.addSublayer(imageGradientLayer)
        }
    }

}
