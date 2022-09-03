//
//  LoginViewModel.swift
//  JayChouMusicApp
//
//  Created by 黃柏嘉 on 2022/9/3.
//

import Foundation

class LoginViewModel{
    
    
    public var sliderImages:[String]{
        return getSliderImage()
    }
    
    func getSliderImage()->[String]{
        var images = [String]()
        
        Album.allCases.forEach { item in
            images.append(item.rawValue)
        }
        
        //做幻燈片最後一張也塞第一張圖片進去
        images.append(Album.allCases[0].rawValue)
        
        return images
    }
    
}
