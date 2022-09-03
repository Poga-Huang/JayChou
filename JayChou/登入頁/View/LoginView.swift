//
//  LoginView.swift
//  JayChouMusicApp
//
//  Created by 黃柏嘉 on 2022/9/3.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak var backView: UIVisualEffectView!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var faceBookLoginBtn: UIButton!
    @IBOutlet weak var lineLoginBtn: UIButton!
    @IBOutlet weak var noLoginBtn: UIButton!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10
        noLoginBtn.layer.cornerRadius = 10
    }
    
    
}
